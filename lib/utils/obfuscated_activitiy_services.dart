// import 'dart:math';

// import 'package:navigationapp/activity/models/models.dart';
// import 'package:navigationapp/utils/constants.dart';

// //REFACTOR, does this list of activities need to be in this class?
// //FIXME check icons,

// List _currentInterests = [];
// final Map<String, dynamic> interestList = {
//   interests: [
//     cooking,
//     fun,
//     health,
//     indoor,
//     mind,
//     outdoor,
//     personalDevelopment,
//     social
//   ]
// };

// class RandomActivityGenerator {
//   static final _activities = [
//     Activity(
//         activity: bakeSomethingSweet,
//         interest: cooking,
//         icon: 0xe477,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: tryANewRecipe,
//         interest: cooking,
//         icon: 0xe477,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: tryMakingCandy,
//         interest: cooking,
//         icon: 0xe477,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: colorAColoringBook,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: recordVideo,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: scrapbook,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: candle,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: carePackage,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: crochet,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: draw,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: cookies,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: needlepoint,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: editPhotos,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: knit,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: collage,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: snowGlobe,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: slime,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: paint,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: recordMusic,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: sew,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: sculpt,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: takePictures,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: childrensBook,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: novel,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: poem,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: writeLetter,
//         interest: fun,
//         icon: 0xe5b1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: lemonade,
//         interest: health,
//         icon: 0xe4f8,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: treatYourself,
//         interest: health,
//         icon: 0xe4f8,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: salad,
//         interest: health,
//         icon: 0xe4f8,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: vitamins,
//         interest: health,
//         icon: 0xe4f8,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: stretch,
//         interest: health,
//         icon: 0xe4f8,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: drinkWater,
//         interest: health,
//         icon: 0xe4f8,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: chess,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: musicalInstrument,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: readBook,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: journal,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: sketch,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: writeBlog,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: drawPainting,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: dance,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: language,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: bake,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: cardGame,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: listenSong,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: audiobook,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: videogame,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: indoorGarden,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: sanitize,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: declutter,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: donate,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: handyman,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: shortcuts,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: decorate,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: paperAirplane,
//         interest: indoor,
//         icon: 0xe5e0,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: puzzle,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: lookAtPhotos,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: bucketList,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: read,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: music,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: meditate,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: podcast,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: readingList,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: vision,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: budget,
//         interest: mind,
//         icon: 0xe568,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: gadgets,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: contactinfo,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: resume,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: washWindows,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: washCar,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: wishlist,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: onlineReviews,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: will,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: makeProduct,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: gratitude,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: professionalGoals,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: personalGoals,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: yardSale,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: deleteApps,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: localClass,
//         interest: personalDevelopment,
//         icon: 0xe499,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: callOldFriend,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: virtualDinner,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: movie,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: drink,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: party,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: network,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: comedy,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: houseParty,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: callFriend,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: roleModel,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: browseSocial,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: onlinecourse,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: news,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: ancestor,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: socialMedia,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: closet,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: passwords,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: emails,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: linkedIn,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: photos,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: coffee,
//         interest: social,
//         icon: 0xe3e1,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: bodyStretch,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: walk,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: yoga,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: bike,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: camp,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: garden,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: playPet,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: trickPet,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: spoilPet,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: travel,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: takeAClass,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: photography,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: fishing,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: noodling,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: mtb,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: boating,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: diving,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: ballooning,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: baseball,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: volleyball,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: tennis,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: golf,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//     Activity(
//         activity: marathon,
//         interest: outdoor,
//         icon: 0xe3d6,
//         completed: false,
//         timeAssigned: ""),
//   ];

//   static Activity getRandomActivity() {
//     return _activities[Random().nextInt(_activities.length)];
//   }

//   static List<Activity> getActivities() {
//     return _activities;
//   }

//   static List<Activity> getFilteredActivities(String interest) {
//     List<Activity> _filteredactivities;

//     _filteredactivities = _activities
//         .where((element) => element.interest.contains(interest))
//         .toList();

//     return _filteredactivities;
//   }
// }
