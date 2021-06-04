 ### activities
- [ ] check icons for activities, are they the right ones and are they consistent in activity_sevice.dart
- [ ] move/rename activity list generator to 'activity store stocker' or something

### tasks
- [ ] what do we want displayed on the task cards?
   - [ ] before complete?
   - [ ] after complete?
   - [ ] do the tasks need a completion/start date?
- [ ] should users be given the option to undo **adding** a task if they don't like it?
- [ ] should completed task disable card? how do we keep from users continually giving themselves points?


### buddy and storing info and retrieving it
 - [ ] I need to finish refactoring buddy page so a buddy choice from the choose_buddy.dart page is saved, and not just the test buddy_page.dart
 - [ ] choose_name.dart -> store buddy name along in buddy store and implement save name
 - [ ] get buddy name from buddy store home_page.dart
 - [ ] on milo_name_picked/sky_name_picked screens, delete extra screen and use buddy bloc name value to fill in name in chat bubble
- [ ]  find out how to only select one buddy

    
### login page, skip onboarding, add splash screen
 - [ ] size of logo for login__form.dart is too small
 - [ ] app.dart needs to check if user completed onboarding. since migrating to a local database, this needs to be implemented again.
 - [ ] add duolyfe splash screen here for phones that don't go immediately to home or login screen fast enough?

### disable save button for < 3 activities
 - [ ] can't disable save button since the flutter 2 update introduced null-safety, need to find another implementation choose_interests.dart



### notification logic
 - [ ] find a place to store the notification time (choose_work_time.dart)
 - [ ] connect the timepicker
 - [ ] decide the text for the notification
 - [ ] implement *onSelectNotification* to trigger what happens when user clicks on notification, i.e. what page
 
 ### settings page
 - [ ] 'Customize Your Buddy' redirects to choose_buddy. do we need a different but similar screen for this? bc we can't have a button that goes back to homepage within the onboarding flow.
- [ ] settings page
    - [ ] redirect to change buddy
    - [ ] redirect to change time
    - [ ] redirect to change interest
    - [ ] theme?



### buddy health
- [ ] find a place to store points - [health] and treats data
- [ ] find a place to keep track of time for the point decrement function
- [ ] buddy health bar ui increase and decrease bars
- [ ] give milo a treat in home_page.dart adds to health logic
- [ ] health bar should be refactored into its own component and then called from different places (flyweight pattern)



#### my suggestion to make implementation easier and keep the same experience
A daily decrease in 5 points *regardless of task completion* would eliminate the need to track tasks over time.

- pts per task per day starting at 0 tasks (new plan)
-5, 5, 15, 25

- pts per task per day starting at 0 tasks (original plan)
-5, 5, 10, 15



Adding 10 points per task would have the net effect of a total of 5pts for the initial task, and 10pts for each additional task completed that day. It would have the same effect as checking if they completed an activity within the last 24 hours, and decreasing by 5 if they didnt. And have the added benefit of a 60% bonus in health for each activity completed beyond the initial activity.

#### requirements for initial idea:
- having a set time once a day to create an interval of 24 hours
- keep track of time that the task is completed
- check if the time the task is completed is within that 24 hour interval
**i honestly don't know how to even begin to do this**

#### requirements for suggested idea:
- having a set time once a day to subtract 5 pts.
- task adds 10pts independent of time
- tasks added at full health are converted to treats and stored.


**benefits** reduces complexity and rewards extra time spent relaxing




### refactoring and clean-up
- [ ] review and delete unneeded code, it's only confusing things
- [ ] change all instances of flatbutton to textbutton. flutter 2 update deprecated flatbutton

###maintenance 
- [ ] I want to do some house keeping on github, such as keeping the main branch *production ready*