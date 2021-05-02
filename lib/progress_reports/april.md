
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


May 1 2021

What I did:
Suggestion is displayed on a button

The problem:
I was having trouble figuring out how to display the task without adding it to the user's task list. In the past, I could add a task to the page but it was also added to the db. The use case here, was to only display the activity, as a possibility, but not save it to the users task unless they picked it.

The solution:
When the task is displayed, I don't need to 'add' it to the db. I can take it, and just display it by essentially holding it in memory until the user decides to do something with it. If the user navigates away from the screen or asks for another suggestion, that task disappears.

What I did:
Added task to the next page

The problem:
As a continuation of the first problem, how do I add this activity to the next page if it isn't saved anywhere? 

The solution:
As long as the activity is displayed on the page, you can still add it to the db. So i just added an extra step between adding an activity to the page and saving it. instead of adding it to the page and saving it to the db at the same time, I added an extra step. This eliminated the need for a third store.

what i did: used the bloc pattern to save the state

the problem: 
how do I add the text to the button from the db?

the solution: I can use the same method to display a task on the task page, minus the part that adds it to the db. Also, since I can display only what I need, I don't have to grab a specific part of the data. i can get the whole object and only display the text.