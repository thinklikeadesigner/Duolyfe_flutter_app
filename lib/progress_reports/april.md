
april 24 2021

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