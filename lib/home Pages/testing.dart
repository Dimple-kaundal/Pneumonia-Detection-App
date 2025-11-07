// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyChatApp());
// }

// class MyChatApp extends StatelessWidget {
//   const MyChatApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});

//   final List<Map<String, dynamic>> messages = const [
//     {
//       "text": "perkenalkan nama saya budi budiman",
//       "color": Colors.pinkAccent,
//       "dot": Colors.purple,
//     },
//     {"text": "halo budiman", "color": Colors.redAccent, "dot": Colors.red},
//     {"text": "halo", "color": Colors.greenAccent, "dot": Colors.green},
//     {
//       "text": "halo salam kenal",
//       "color": Colors.amberAccent,
//       "dot": Colors.orange,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF4A6CF7), Color(0xFF2663EB)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 50),

//             // Chat messages
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(12),
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msg = messages[index];
//                   return Container(
//                     margin: const EdgeInsets.symmetric(vertical: 6),
//                     child: Row(
//                       children: [
//                         // Colored dot
//                         Container(
//                           width: 16,
//                           height: 16,
//                           decoration: BoxDecoration(
//                             color: msg["dot"],
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 8),

//                         // Message bubble
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: msg["color"],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               msg["text"],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),

//             // Bottom arc with 3 circular buttons
//             Container(
//               width: double.infinity,
//               height: 160,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF1F4BD3),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(150),
//                   topRight: Radius.circular(150),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Left circular button
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: const BoxDecoration(
//                       color: Colors.blueAccent,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.description,
//                       color: Colors.white,
//                       size: 28,
//                     ),
//                   ),

//                   // Middle bigger mic button
//                   Container(
//                     width: 90,
//                     height: 90,
//                     decoration: const BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(Icons.mic, color: Colors.white, size: 40),
//                   ),

//                   // Right circular button
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: const BoxDecoration(
//                       color: Colors.blueAccent,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.settings,
//                       color: Colors.white,
//                       size: 28,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
