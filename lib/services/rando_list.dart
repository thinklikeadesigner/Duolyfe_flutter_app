import 'dart:math';

List shuffle(List items) {
  var random = new Random();
  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);
    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }
  return items;
}

// main() {
// var items = [
//   'rock climb',
//   'drink tea',
//   'bake a cake',
//   'walk your dog',
//   'meditate',
//   'write in your journal',
//   'read a book',
//   'sing a song',
//   'take a picture of a pretty landscape',
//   'paint a picture',
//   'go for a hike',
//   'call an old friend',
//   'get coffee with a relative'
// ];
//   var shuffledItems = shuffle(items);
//   var pickThree = shuffledItems.sublist(0, 3);
//   print(pickThree);
//   return pickThree;
// }

var items = [
  'rock climb',
  'drink tea',
  'bake a cake',
  'walk your dog',
  'meditate',
  'write in your journal',
  'read a book',
  'sing a song',
  'take a picture of a pretty landscape',
  'paint a picture',
  'go for a hike',
  'call an old friend',
  'get coffee with a relative'
];
