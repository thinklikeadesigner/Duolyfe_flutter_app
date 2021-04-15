import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/theme.dart';

import 'models/buddy.dart';
import 'buddy_bloc/bloc.dart';

class BuddyPage extends StatefulWidget {
  _BuddyPageState createState() => _BuddyPageState();
}

class _BuddyPageState extends State<BuddyPage> {
  BuddyBloc _buddyBloc;

  @override
  void initState() {
    super.initState();
    // Obtaining the BuddyBloc instance through BlocProvider which is an InheritedWidget
    _buddyBloc = BlocProvider.of<BuddyBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading buddys right from the start.
    _buddyBloc.add(LoadBuddys());
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
          _buddyBloc.add(AddRandomBuddy());
        },
      ),
    );
  }

//TODO figure out why completed isn't updating in real time
//TODO figure out how to load all the buddys, and then add the buddy's from buddy store to user store
//TODO create a interest store, and do the same thing, add categories from interest store to user store
//TODO for interests, you can just build the task list based on items added to user activities store.
//TODO bloc for treat logic, look at bloc counter app for inspo.
//TODO the activity needs to have the interest and the icon stored with it
//TODO maybe when user clicks interest, all the activities are added to the user object
//TODO also add buddy name to buddy store somehow
//
  Widget _buildBody() {
    return BlocBuilder<BuddyBloc, BuddyState>(
      // Whenever there is a new state emitted from the bloc, builder runs.
      builder: (BuildContext context, BuddyState state) {
        if (state is BuddysLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BuddysLoaded) {
          return ListView.builder(
            itemCount: state.buddys.length,
            itemBuilder: (context, index) {
              final displayedBuddy = state.buddys[index];
              // final newTime = DateTime.parse(displayedBuddy.timeAssigned);
              Icon check;
              String selected;
              if (displayedBuddy.selected == true) {
                check = Icon(Icons.radio_button_checked);
                selected = "Completed!";
              } else {
                check = Icon(Icons.radio_button_off);
                selected = "Tap to mark complete!";
              }

              return Dismissible(
                // uniquely identify widgets.
                key: Key(displayedBuddy.id.toString()),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    _buddyBloc.add(DeleteBuddy(displayedBuddy));

                    state.buddys.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("buddy deleted")));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    //TODO implement changing state of card from incomplete to complete
                    // print(displayedBuddy.selected);
                    displayedBuddy.selected = !displayedBuddy.selected;
                    print('${displayedBuddy.selected}');
                    _buddyBloc.add(UpdateBuddy(displayedBuddy));
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
                                  Image.asset(displayedBuddy.buddy),
                                  // Icon(
                                  //     IconData(displayedBuddy.buddy,
                                  //         fontFamily: 'MaterialIcons'),
                                  //     size: 40),
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
                                      //   displayedBuddy.activity,
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
                            // _buildUpdateDeleteButtons(displayedBuddy),
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

  Row _buildUpdateDeleteButtons(Buddy displayedBuddy) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            _buddyBloc.add(UpdateBuddy(displayedBuddy));
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.delete_outline),
        //   onPressed: () {
        //     _buddyBloc.add(DeleteBuddy(displayedBuddy));
        //   },
        // ),
      ],
    );
  }
}
