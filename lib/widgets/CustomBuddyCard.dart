// import 'package:flutter/material.dart';

// class CustomBuddyCard extends StatelessWidget {
//   final int index;
//   final bool isSelected;
//   final String buddyPic;
//   final VoidCallback onSelect;
//   final Function(int) onChoiceChanged;

//   const CustomBuddyCard(
//       {Key key,
//       @required this.index,
//  this.isSelected,
// this.onSelect,
//        this.buddyPic,
//       this.onChoiceChanged});

// //   @override
// //   _CustomBuddyCardState createState() => _CustomBuddyCardState();
// // }

// // class _CustomBuddyCardState extends State<CustomBuddyCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         splashColor: Colors.blue.withAlpha(30),
//         onTap: () => onSelect(),

//         child: Container(
//           height: 20,
//           child: Center(
//               child: Image(
//                   image: AssetImage(buddyPic), height: 150),
//               ),
//         ),
//       ),
//       color: isSelected ? Colors.grey : Colors.white,
//     );
//   }
// }
