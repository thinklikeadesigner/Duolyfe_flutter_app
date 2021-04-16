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
    // We want to start loading buddies right from the start.
    _buddyBloc.add(LoadBuddies());
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
          _buddyBloc.add(AddRandomBuddy());
        },
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BuddyBloc, BuddyState>(
      // Whenever there is a new state emitted from the bloc, builder runs.
      builder: (BuildContext context, BuddyState state) {
        if (state is BuddiesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BuddiesLoaded) {
          return ListView.builder(
            itemCount: state.buddies.length,
            itemBuilder: (context, index) {
              final displayedBuddy = state.buddies[index];
              // final newTime = DateTime.parse(displayedBuddy.timeAssigned);
              Icon check;
              String selected;
              if (displayedBuddy.selected == true) {
                check = Icon(Icons.radio_button_checked);
                selected = "selected!";
              } else {
                check = Icon(Icons.radio_button_off);
                selected = "Tap to select!";
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

                    state.buddies.removeAt(index);
                  });
//TODO find out how to only select one buddy
//TODO also prepulate the list with all the buddies
//
/*for now, the working solution is to just
 keep cycling through the buddies,
  since you will only have one in the list*/

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("buddy deleted")));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    // print(displayedBuddy.selected);
                    // displayedBuddy.selected = !displayedBuddy.selected;
                    // print(displayedBuddy.selected);
                    _buddyBloc.add(UpdateWithRandomBuddy(displayedBuddy));
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

//   Row _buildUpdateDeleteButtons(Buddy displayedBuddy) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         IconButton(
//           icon: Icon(Icons.refresh),
//           onPressed: () {
//             _buddyBloc.add(UpdateBuddy(displayedBuddy));
//           },
//         ),
//         // IconButton(
//         //   icon: Icon(Icons.delete_outline),
//         //   onPressed: () {
//         //     _buddyBloc.add(DeleteBuddy(displayedBuddy));
//         //   },
//         // ),
//       ],
//     );
//   }
}
