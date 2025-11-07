// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/test.dart' as rec;
// import 'package:record/record.dart' as rec; // ✅ alias only record package

  
  

// class AuscultationScreen extends StatefulWidget {
//   const AuscultationScreen({super.key});

//   @override
//   State<AuscultationScreen> createState() => _AuscultationScreenState();
// }

// class _AuscultationScreenState extends State<AuscultationScreen> {
//   final rec.Record _recorder = rec.Record(); // ✅ v6 API
//   bool _isRecording = false;
//   String? _currentSite;

//   // Track which lung sites are recorded
//   final Map<String, bool> recordedSites = {
//     "RUL": false, "RML": false, "RLL": false, "LUL": false, "LLL": false,
//     "RUB": false, "RMB": false, "RLB": false, "LUB": false, "LMB": false, "LLB": false,
//   };

//   Future<void> _recordSound(String site) async {
//     try {
//       // Stop if already recording (toggle behavior)
//       if (_isRecording) {
//         final path = await _recorder.stop();
//         if (path != null && _currentSite != null) {
//           setState(() {
//             recordedSites[_currentSite!] = true;
//           });
//           debugPrint("Saved: $path");
//         }
//         setState(() {
//           _isRecording = false;
//           _currentSite = null;
//         });
//         return;
//       }

//       // Start new recording
//       if (!await _recorder.hasPermission()) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Microphone permission denied')),
//         );
//         return;
//       }

//       final dir = await pp.getApplicationDocumentsDirectory();
//       final filename =
//           "child123_${site}_${DateTime.now().millisecondsSinceEpoch}.wav";
//       final filepath = "${dir.path}/$filename";

//       await _recorder.start(
//         const rec.RecordConfig(
//           encoder: rec.AudioEncoder.wav,
//           bitRate: 128000,
//           sampleRate: 44100,
//         ),
//         path: filepath,
//       );

//       setState(() {
//         _isRecording = true;
//         _currentSite = site;
//       });
//       debugPrint("Recording $site -> $filepath");
//     } catch (e) {
//       debugPrint("Recording error: $e");
//       setState(() {
//         _isRecording = false;
//         _currentSite = null;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _recorder.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Chest Auscultation")),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 12),
//             Text(
//               _isRecording
//                   ? "Recording ${_currentSite ?? ''}… tap again to stop"
//                   : "Tap a site to start recording",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 12),

//             // FRONT VIEW
//             Stack(
//               children: [
//                 Image.asset("assets/anterior.png", fit: BoxFit.contain),
//                 _hotspot("RUL", 80, 50),
//                 _hotspot("RML", 90, 120),
//                 _hotspot("RLL", 100, 200),
//                 _hotspot("LUL", 220, 50),
//                 _hotspot("LLL", 210, 200),
//               ],
//             ),

//             const SizedBox(height: 24),
//             const Divider(),
//             const Text(
//               "Posterior View",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),

//             // BACK VIEW
//             Stack(
//               children: [
//                 Image.asset("assets/posterior.png", fit: BoxFit.contain),
//                 _hotspot("RUB", 80, 40),
//                 _hotspot("RMB", 90, 120),
//                 _hotspot("RLB", 100, 200),
//                 _hotspot("LUB", 220, 40),
//                 _hotspot("LMB", 210, 120),
//                 _hotspot("LLB", 210, 200),
//               ],
//             ),

//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: zip & upload all saved wav files for this child
//               },
//               child: const Text("Upload All Recordings"),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _hotspot(String site, double left, double top) {
//     final done = recordedSites[site] ?? false;
//     final isActive = _isRecording && _currentSite == site;

//     return Positioned(
//       left: left,
//       top: top,
//       child: GestureDetector(
//         onTap: () => _recordSound(site),
//         child: CircleAvatar(
//           radius: 18,
//           backgroundColor: isActive
//               ? Colors.orange
//               : (done ? Colors.green : Colors.red),
//           child: Text(
//             site,
//             style: const TextStyle(fontSize: 10, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
