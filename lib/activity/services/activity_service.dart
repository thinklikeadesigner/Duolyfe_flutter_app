import 'dart:math';

import '../models/activity.dart';

class RandomActivityGenerator {
  static final _activities = [
    Activity(
        activity: "Bake Something Sweet!",
        interest: "cooking",
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Try a new Recipe",
        interest: "cooking",
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Try Making Candy",
        interest: "cooking",
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Color a  coloring book",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Record a video with friends",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Create a scrapbook",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Create your own candle(s)",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make a care package",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Crochet something",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Draw a picture",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Decorate cookies",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Do Needle Point",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Edit photos",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Knit something cute",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make a collage of pictures",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make a snow globe",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make homemade slime",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make homemade slime",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Paint something fun",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Record music",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Sew something cool",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Sculpt with clay",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Take some Pictures",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write a children’s story",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write a Novel",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write a Poem",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write a letter to yourself",
        interest: "fun",
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make lemonade",
        interest: "health",
        icon: 0xe3de,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Have a fruit salad",
        interest: "health",
        icon: 0xe3de,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Read a book",
        interest: "health",
        icon: 0xe3de,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Take vitamins",
        interest: "health",
        icon: 0xe3de,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Stretch or Do Yoga",
        interest: "health",
        icon: 0xe3de,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Drink a full glass of water",
        interest: "health",
        icon: 0xe3de,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Play Chess",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Play a musical instrument",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Read a book",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write a journal",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Draw some sketches",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write a blog article",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Draw a painting",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Dance to a song",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Learn a language",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Bake a cake or bread",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Play a Solo Card Game",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Sing your favorite songs",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "listen to a new audiobook",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Play retro Video Game",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Start an Indoor Garden",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Sanitize your electronics",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "De-clutter your house",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Donate items",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Learn a Handyman skill",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Learn keyboard shortcuts",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Redecorate",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make a paper airplane",
        interest: "indoor",
        icon: 0xe5e0,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Solve a Fun Puzzle",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Look at old photos",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Start writing a bucket list",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Read a Book or Magazine",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Listen to music",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Meditate",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Listen to a podcast",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "list books you want to read",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Create a vision board",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make a budget",
        interest: "mind",
        icon: 0xe568,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Update your gadgets",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Update contact information",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Update your Resume",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Wash your homes windows",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Wash your car",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Work on a wishlist",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Start a Journal",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write some online reviews",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Write your will",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Make a Household Product",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Express gratitude",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "set professional goals",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "set Personal goals",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Organize a yard sale",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Delete old apps",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Set some personal goals",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Sign up for a local class",
        interest: "personal development",
        icon: 0xe499,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Call your school friend",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Do a virtual dinner friends",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Watch a movie",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Get your favorite drink",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "plan a party",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Attend a Networking Event",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Watch a comedy show",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Host a small house party",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Call a friend",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Message a role model",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Browse social media",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "take online learning course",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Read up on current news",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Trace down your ancestry",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Clean up your social media",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Clean out your closet",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Update your passwords",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Clean up your emails",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Fine-tune your LinkedIn",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "look at photos",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: "Have coffee with someone",
        interest: "social",
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
  ];

  static Activity getRandomActivity() {
    return _activities[Random().nextInt(_activities.length)];
  }

  static List<Activity> getActivities() {
    return _activities;
  }

  static List<Activity> getFilteredActivities(String interest) {
    List<Activity> _filteredactivities;

    _filteredactivities = _activities
        .where((element) => element.interest.contains(interest))
        .toList();

    return _filteredactivities;
  }
}
