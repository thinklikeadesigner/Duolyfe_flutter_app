import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/theme.dart';

import 'models/task.dart';
import 'task_bloc/bloc.dart';

class TaskPage extends StatefulWidget {
  _TaskPageState createState() => _TaskPageState();
}



//SPECS this is where points are added to buddy, tasks are completed, and time is assigned

class _TaskPageState extends State<TaskPage> {
  TaskBloc _taskBloc;

  @override
  void initState() {
    super.initState();
    // Obtaining the TaskBloc instance through BlocProvider which is an InheritedWidget
    _taskBloc = BlocProvider.of<TaskBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading tasks right from the start.
    _taskBloc.add(LoadTasks());
    // _taskBloc.add(AddRandomTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),


    );
  }

  Widget _buildBody() {
    return BlocBuilder<TaskBloc, TaskState>(
      // Whenever there is a new state emitted from the bloc, builder runs.
      builder: (BuildContext context, TaskState state) {
        if (state is TasksLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TasksLoaded) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final displayedTask = state.tasks[index];
              //BUG wont display time properly
              final newTime = DateTime.parse(displayedTask.timeAssigned);
              // final newTime = DateTime.now();
              Icon check;
              String completed;
              if (displayedTask.completed == true) {
                check = Icon(Icons.radio_button_checked);
                completed = "Completed!";
              } else {
                check = Icon(Icons.radio_button_off);
                completed = "Tap to mark complete!";
              }

              return Dismissible(
                // uniquely identify widgets.
                key: Key(displayedTask.id.toString()),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    _taskBloc.add(DeleteTask(displayedTask));

                    state.tasks.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("task deleted")));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: primaryTeal),
                child: GestureDetector(
                  onTap: () {
                    _taskBloc.add(UpdateTask(displayedTask));
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
                                      IconData(displayedTask.icon,
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
                                        displayedTask.activity,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Text(completed),
                                      SizedBox(height: 10),
                                      //BUG wont display time properly
                                      Text(
                                        '${newTime.month}/${newTime.day}/${newTime.year}',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // _buildUpdateDeleteButtons(displayedTask),
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

  Row _buildUpdateDeleteButtons(Task displayedTask) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            _taskBloc.add(UpdateTask(displayedTask));
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.delete_outline),
        //   onPressed: () {
        //     _taskBloc.add(DeleteTask(displayedTask));
        //   },
        // ),
      ],
    );
  }
}
