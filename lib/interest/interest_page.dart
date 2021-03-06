import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/interest/bloc/interest_bloc.dart';
import 'package:navigationapp/theme.dart';

//QUESTION do i even need an interest page/bloc/whatever?

class InterestPage extends StatefulWidget {
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  InterestBloc _interestBloc;

  @override
  void initState() {
    super.initState();
    // Obtaining the InterestBloc instance through BlocProvider which is an InheritedWidget
    _interestBloc = BlocProvider.of<InterestBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading interests right from the start.
    _interestBloc.add(LoadInterests());
  }

  @override
  Widget build(BuildContext context) {
    // final ScrollController _scrollController = ScrollController();
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Do a thing!'),
      // ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _interestBloc.add(AddRandomInterest());
        },
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<InterestBloc, InterestState>(
      // Whenever there is a new state emitted from the bloc, builder runs.
      builder: (BuildContext context, InterestState state) {
        if (state is InterestsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is InterestsLoaded) {
          return ListView.builder(
            itemCount: state.interests.length,
            itemBuilder: (context, index) {
              final displayedInterest = state.interests[index];
              // final newTime = DateTime.parse(displayedInterest.timeAssigned);
              Icon check;
              String selected;
              if (displayedInterest.selected == true) {
                check = Icon(Icons.radio_button_checked);
                selected = "selected!";
              } else {
                check = Icon(Icons.radio_button_off);
                selected = "Tap to select!";
              }

              return Dismissible(
                // uniquely identify widgets.
                key: Key(displayedInterest.id.toString()),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    _interestBloc.add(DeleteInterest(displayedInterest));

                    state.interests.removeAt(index);
                  });

/* NOTE for now, the working solution is to just
 keep cycling through the interests,
  since you will only have one in the list*/

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("interest deleted")));
                },
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    // print(displayedInterest.selected);
                    // displayedInterest.selected = !displayedInterest.selected;
                    // print(displayedInterest.selected);
                    _interestBloc
                        .add(UpdateWithRandomInterest(displayedInterest));
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
                                  Image.asset(displayedInterest.interest),
                                  // Icon(Icons.spa),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      // Text(
                                      //   displayedInterest.activity,
                                      //   style: TextStyle(fontSize: 20),
                                      // ),
                                      SizedBox(height: 10),
                                      Text(selected),
                                      SizedBox(height: 10),
                                      // Text(
                                      //   '${newTime.month}/${newTime.day}/${newTime.year} at ${newTime.hour}:${newTime.minute} and ${newTime.second} seconds',
                                      //   style: TextStyle(fontSize: 10),
                                      // ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // _buildUpdateDeleteButtons(displayedInterest),
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

//   Row _buildUpdateDeleteButtons(Interest displayedInterest) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         IconButton(
//           icon: Icon(Icons.refresh),
//           onPressed: () {
//             _interestBloc.add(UpdateInterest(displayedInterest));
//           },
//         ),
//         // IconButton(
//         //   icon: Icon(Icons.delete_outline),
//         //   onPressed: () {
//         //     _interestBloc.add(DeleteInterest(displayedInterest));
//         //   },
//         // ),
//       ],
//     );
//   }
}
