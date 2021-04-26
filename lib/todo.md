TODOTREE CODE OF HONOR after logging todos, pick a couple of things to work on each day and stick to those things, if you see other things to fix, make a comment but don't get distracted!!!


CREATED
    - [x] create todo system
PENDING
    - [x] please check the other folders and files for missing pieces
TEST  
    - [x] TEST check if adds interest to activity store
TEST 
    - [x]  check if removes interest to activity store
TEST 
    - [x]  these functions and tell me what happens
TEST 
    - [x]  if added to activity store
TEST 
    - [x]  if removed from activity store
FIXME 
    - [x]  I dont need to add all activities, just initial activities
FIXME 
    - [x]  I don't need to add a single activity, just the initial activities
FIXME 
    - [x]  I don't need to delete a single activity, just the initial activities
URGENT 
    - [ ]  need to figure out how to read Activity<List> from ACTIVITY_STORE, randomize those Activity<List>, cast it into Task type and then put Task into TASK_STORE
PENDING 
    - [ ]  need to find out how to enter text onto buttons on HomePage from the output of TaskBloc's random tasks, for at least one button.




What I did:
Solved the problem of filtering the activities by user interests

The problem:
I could not figure out how to get a list of interests, go through that list of interests and 
for every interest, grab all the activities. repeat until done.
that was hard to do, because i had to wait for a response after each loop, and working with requests and responses chained together is really confusing

The solution:
Instead of trying to grab the activities all at once, I can grab the activities one interest at a time, that is, when the user checks a box, grabs those activities and write them to the db, when they uncheck the box, delete those activities from the db

What I did:
Figured out I did not need to 'preload' the db

The problem:
How to make the app know what needs to be in the database, if the database only "opens" once, and it opens the first time the program runs (on first install)

The solution:
The only items that need to be in the database, are the items that change. The simplest way is to start with an empty database, and fill it with only items that weren't there before. Everything else, such a lists of activities and buddies to choose from, will be stored in the assets folder, and loaded into the database only the items that the user needs to save. ie, THEIR activities, not all activities. THEIR buddy, not all buddies

What I did:
Refined buddy models and task models

The problem:
I did not know where I needed to save the chosen notification, or the 'onboarding completed' flag, or other miscellaneous info. Technically, there isn't a "user". if there were multiple people interacting with the same app, there would be users. but since it is a solo app (for now),
it isn't semantically correct to make a user store/collection/table

The solution:
While there isn't a user, there is a buddy. If you think about it, it is the buddy that sends you the notification, the buddy that alerts you that the onboarding is complete, the buddy that has health, and treats, etc. Therefore I modified the buddy model to include the standard "user" information

The solution

