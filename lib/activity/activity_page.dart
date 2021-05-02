import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/theme.dart';
import 'activity_bloc/bloc.dart';

//NOTE this is a test page, so i can see visually if the tasks have been added or removed

class ActivityPage extends StatefulWidget {
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  ActivityBloc _activityBloc;

  @override
  void initState() {
    super.initState();
    _activityBloc = BlocProvider.of<ActivityBloc>(context);
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
            _activityBloc.add(AddAllActivities());
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
                key: Key(displayedActivity.id.toString()),
                onDismissed: (direction) {
                  setState(() {
                    _activityBloc.add(DeleteActivity(displayedActivity));

                    state.activities.removeAt(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("activity deleted")));
                },
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    _activityBloc.add(UpdateActivity(displayedActivity));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
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
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
}
