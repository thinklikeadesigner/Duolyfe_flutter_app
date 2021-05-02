import 'dart:math';

import 'package:navigationapp/tasks/models/models.dart';


//REFACTOR, does this list of activities need to be in this class?
//FIXME check icons,

class RandomActivityGenerator {
  static final _activities = [
    Task(
        activity: "Bake Something Sweet!",
        interest: "cooking",
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Try a new Recipe",
        interest: "cooking",
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Try Making Candy",
        interest: "cooking",
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Color a  coloring book",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Record a video with friends",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Create a scrapbook",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Create your own candle(s)",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make a care package",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Crochet something",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Draw a picture",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Decorate cookies",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Do Needle Point",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Edit photos",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Knit something cute",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make a collage of pictures",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make a snow globe",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make homemade slime",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make homemade slime",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Paint something fun",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Record music",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Sew something cool",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Sculpt with clay",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Take some Pictures",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write a children’s story",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write a Novel",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write a Poem",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write a letter to yourself",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make lemonade",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Treat yourself",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Have a fruit salad",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Read a book",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Take vitamins",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Stretch or Do Yoga",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Drink a full glass of water",
        interest: "health",
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play Chess",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play a musical instrument",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Read a book",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write a journal",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Draw some sketches",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write a blog article",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Draw a painting",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Dance to a song",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Learn a language",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Bake a cake or bread",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play a Solo Card Game",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Sing your favorite songs",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "listen to a new audiobook",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play retro Video Game",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Start an Indoor Garden",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Sanitize your electronics",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "De-clutter your house",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Donate items",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Learn a Handyman skill",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Learn keyboard shortcuts",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Redecorate",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make a paper airplane",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Solve a Fun Puzzle",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Look at old photos",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Start writing a bucket list",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Read a Book or Magazine",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Listen to music",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Meditate",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Listen to a podcast",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "list books you want to read",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Create a vision board",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make a budget",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Update your gadgets",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Update contact information",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Update your Resume",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Wash your homes windows",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Wash your car",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Work on a wishlist",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Start a Journal",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write some online reviews",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Write your will",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Make a Household Product",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Express gratitude",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "set professional goals",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "set Personal goals",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Organize a yard sale",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Delete old apps",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Set some personal goals",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Sign up for a local class",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Call your school friend",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Do a virtual dinner friends",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Watch a movie",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Get your favorite drink",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "plan a party",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Attend a Networking Event",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Watch a comedy show",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Host a small house party",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Call a friend",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Message a role model",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Browse social media",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "take online learning course",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Read up on current news",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Trace down your ancestry",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Clean up your social media",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Clean out your closet",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Update your passwords",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Clean up your emails",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Fine-tune your LinkedIn",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "look at photos",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Have coffee with someone",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Do body stretching",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go for a walk",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Practice Yoga",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go for cycling",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go out for camping",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Gardening",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play with your Pet",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Teach your pet a new trick",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Spoil your pet with a new treat",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Plan a travel or road trip",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Sign up for a local class",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Photography",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go Fishing",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go Noodling",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go Mountain Biking",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go Boating",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go Scuba diving and snorkeling",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Go Hot air ballooning",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play Baseball or softball",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play Volleyball",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play Tennis",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Play Golf",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: "Run a marathon",
        interest: "outdoor",
        icon: 0xe3d6,
        completed: false,
        timeAssigned: ""),
  ];

  static Task getRandomTask() {
    return _activities[Random().nextInt(_activities.length)];
  }

  static List<Task> getActivities() {
    return _activities;
  }

  static List<Task> getFilteredActivities(String interest) {
    List<Task> _filteredactivities;

    _filteredactivities = _activities
        .where((element) => element.interest.contains(interest))
        .toList();

    return _filteredactivities;
  }
}
