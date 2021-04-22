import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/theme.dart';

import 'models/activity.dart';
import 'activity_bloc/bloc.dart';

class ActivityPage extends StatefulWidget {
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  ActivityBloc _activityBloc;

  @override
  void initState() {
    super.initState();
    // Obtaining the ActivityBloc instance through BlocProvider which is an InheritedWidget
    _activityBloc = BlocProvider.of<ActivityBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading activities right from the start.
    _activityBloc.add(LoadActivities());
    // _activityBloc.add(AddAllActivities());
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
            _activityBloc.add(AddRandomActivity());
          },
        ),
        bottomSheet: Row(
          children: [
            TextButton(
                onPressed: () {
                  _activityBloc.add(ClearActivities());
                },
                child: Text('clear')),
            TextButton(
                onPressed: () {
                  _activityBloc.add(AddFilteredActivities());
                },
                child: Text('filter')),
          ],
        ));
  }

  Widget _buildBody() {
    return BlocBuilder<ActivityBloc, ActivityState>(
      // Whenever there is a new state emitted from the bloc, builder runs.
      builder: (BuildContext context, ActivityState state) {
        if (state is ActivitiesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ActivitiesLoaded) {
          return ListView.builder(
            itemCount: state.activities.length,
            itemBuilder: (context, index) {
              final displayedActivity = state.activities[index];
              // final newTime = DateTime.now();
              // final newTime = DateTime.parse(displayedActivity.timeAssigned);
              Icon check;
              String completed;
              if (displayedActivity.completed == true) {
                check = Icon(Icons.radio_button_checked);
                completed = "Completed!";
              } else {
                check = Icon(Icons.radio_button_off);
                completed = "Tap to mark complete!";
              }

              return Dismissible(
                // uniquely identify widgets.
                key: Key(displayedActivity.id.toString()),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    _activityBloc.add(DeleteActivity(displayedActivity));

                    state.activities.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("activity deleted")));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    // print(displayedActivity.completed);
                    // displayedActivity.completed = !displayedActivity.completed;
                    // print(displayedActivity.completed);
                    _activityBloc.add(UpdateActivity(displayedActivity));
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
                                  Icon(
                                      IconData(displayedActivity.icon,
                                          fontFamily: 'MaterialIcons'),
                                      size: 40),
                                  // Icon(Icons.spa),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        displayedActivity.activity,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Text(completed),
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
                            _buildUpdateDeleteButtons(
                                ['cooking', 'outdoor', 'mind']),
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

  Row _buildUpdateDeleteButtons(List<String> chosenActivities) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            chosenActivities = ['cooking', 'outdoor', 'mind'];

            _activityBloc.add(SubmitActivities(chosenActivities));
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.delete_outline),
        //   onPressed: () {
        //     _activityBloc.add(DeleteActivity(displayedActivity));
        //   },
        // ),
      ],
    );
  }
}
