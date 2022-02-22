// import 'package:flutter/material.dart';
// import 'package:v_player/buttonfunction.dart';
// import 'package:share_plus/share_plus.dart';
//
// class PostButton extends StatefulWidget {
//   @override
//   _PostButtonState createState() => _PostButtonState();
// }
//
// class _PostButtonState extends State<PostButton> {
//   bool active = false;
//   bool active2 = false;
//   bool active3 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             setState(() {
//               active = !active;
//             });
//           },
//           icon: Icon(
//             active ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
//             color: Colors.blue.shade800,
//             size: 30,
//           ),
//         ),
//         SizedBox(
//           width: 05.0,
//         ),
//         IconButton(
//           onPressed: () {
//             showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 builder: (context) => SingleChildScrollView(
//                         child: Container(
//                       padding: EdgeInsets.only(
//                           bottom: MediaQuery.of(context).viewInsets.bottom),
//                       child: AddComment((newCommentadd) {
//                         print(newCommentadd);
//                       }),
//                     )));
//             setState(() {
//               active2 = !active2;
//             });
//           },
//           icon: Icon(
//             active2 ? Icons.chat_rounded : Icons.chat_outlined,
//             color: Colors.blue.shade800,
//             size: 30,
//           ),
//         ),
//         SizedBox(
//           width: 05.0,
//         ),
//         IconButton(
//           onPressed: () async {
//             await Share.share("Enjoy the videos");
//             setState(() {
//               active3 = !active3;
//             });
//           },
//           icon: Icon(
//             active3 ? Icons.share_sharp : Icons.share_outlined,
//             color: Colors.blue.shade800,
//             size: 30,
//           ),
//         )
//       ],
//     );
//   }
// }
