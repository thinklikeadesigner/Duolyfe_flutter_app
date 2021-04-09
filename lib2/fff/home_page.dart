import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/theme.dart';

import 'data/fruit.dart';
import 'fruit_bloc/bloc.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FruitBloc _fruitBloc;

  @override
  void initState() {
    super.initState();
    // Obtaining the FruitBloc instance through BlocProvider which is an InheritedWidget
    _fruitBloc = BlocProvider.of<FruitBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
    _fruitBloc.add(LoadFruits());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Do a thing!'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _fruitBloc.add(AddRandomFruit());
        },
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<FruitBloc, FruitState>(
      // Whenever there is a new state emitted from the bloc, builder runs.
      builder: (BuildContext context, FruitState state) {
        if (state is FruitsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FruitsLoaded) {
          return ListView.builder(
            itemCount: state.fruits.length,
            itemBuilder: (context, index) {
              final displayedFruit = state.fruits[index];
              Icon check;
              if (displayedFruit.completed == true) {
                check = Icon(Icons.radio_button_checked);
              } else {
                check = Icon(Icons.radio_button_off);
              }

              return Dismissible(
                // uniquely identify widgets.
                key: Key(displayedFruit.id.toString()),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    _fruitBloc.add(DeleteFruit(displayedFruit));

                    state.fruits.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("task deleted")));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    //TODO implement changing state of card from incomplete to complete
                    // print(displayedFruit.completed);
                    // displayedFruit.completed = !displayedFruit.completed;
                    // print(displayedFruit.completed);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      // margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(IconData(displayedFruit.icon,
                                      fontFamily: 'MaterialIcons')),
                                  // Icon(Icons.spa),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        displayedFruit.activity,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(displayedFruit.interest),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // _buildUpdateDeleteButtons(displayedFruit),
                            check,
                          ],
                        ),
                      )),
                ),
              );
            },
          );
        }
        return Center();
      },
    );
  }

  Row _buildUpdateDeleteButtons(Fruit displayedFruit) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            _fruitBloc.add(UpdateWithRandomFruit(displayedFruit));
          },
        ),
        IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            _fruitBloc.add(DeleteFruit(displayedFruit));
          },
        ),
      ],
    );
  }
}
