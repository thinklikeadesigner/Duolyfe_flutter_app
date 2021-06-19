import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/tasks/task_page.dart';
import 'package:uic/widgets.dart';

//QUESTION what is this for?
class TaskNav extends StatefulWidget {
  @override
  _TaskNavState createState() => _TaskNavState();
}

class _TaskNavState extends State<TaskNav> {
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
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BuddyBloc, BuddyState>(builder: (context, state) {
      if (state is BuddiesLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BuddiesLoaded) {
        final displayBuddy = state.buddies[0];
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                child:
                    Image(image: AssetImage(displayBuddy.buddy ?? "panda.png"), height: 150),
              ),
              StepIndicator(
                selectedStepIndex: 3,
                totalSteps: 6,
                selectedStep: Icon(
                  Icons.radio_button_checked,
                  color: Theme.of(context).accentColor,
                ),
                completedStep: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [TaskPage()],
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        );
      }
      return Center();
    });
  }
}
