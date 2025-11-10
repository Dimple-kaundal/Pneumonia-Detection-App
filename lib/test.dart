// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:record/record.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:external_path/external_path.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: LungRecorder(),
//   ));
// }

// class LungRecorder extends StatefulWidget {
//   const LungRecorder({super.key});

//   @override
//   State<LungRecorder> createState() => _LungRecorderState();
// }

// class _LungRecorderState extends State<LungRecorder> {
//   final _recorder = AudioRecorder();
//   final _player = AudioPlayer();
//   bool _isRecording = false;
//   bool _hasRecorded = false;
//   double _amplitude = 0;
//   String? _filePath;
//   Timer? _levelTimer;

//   /// Start or stop recording toggle
//   Future<void> _toggleRecording() async {
//     if (_isRecording) {
//       await _stopRecording();
//     } else {
//       await _startRecording();
//     }
//   }

//   Future<void> _startRecording() async {
//     if (!await _recorder.hasPermission()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Microphone permission denied')),
//       );
//       return;
//     }

//     // File path
//     final downloadsDir = await ExternalPath.getExternalStoragePublicDirectory(
//       ExternalPath.DIRECTORY_DOWNLOAD,
//     );
//     final timestamp = DateTime.now().millisecondsSinceEpoch;
//     final path = '$downloadsDir/lung_record_$timestamp.wav';
//     _filePath = path;

//     debugPrint("🎙️ Saving temporary file to: $path");

//     await _recorder.start(
//       RecordConfig(
//         encoder: AudioEncoder.wav,
//         bitRate: 128000,
//         sampleRate: 44100,
//       ),
//       path: path,
//     );

//     // Amplitude animation
//     _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
//       final amp = await _recorder.getAmplitude();
//       setState(() => _amplitude = amp.current.abs().clamp(0, 100));
//     });

//     setState(() {
//       _isRecording = true;
//       _hasRecorded = false;
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Recording started...')),
//     );
//   }

//   Future<void> _stopRecording() async {
//     await _recorder.stop();
//     _levelTimer?.cancel();

//     setState(() {
//       _isRecording = false;
//       _hasRecorded = true;
//     });

//     debugPrint("✅ Recording completed: $_filePath");

//     _showSaveOrDiscardDialog();
//   }

//   Future<void> _playRecording() async {
//     if (_filePath == null || !File(_filePath!).existsSync()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No recording found')),
//       );
//       return;
//     }

//     try {
//       await _player.play(DeviceFileSource(_filePath!));
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Playing recording...')),
//       );
//     } catch (e) {
//       debugPrint("❌ Error playing file: $e");
//     }
//   }

//   void _showSaveOrDiscardDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.grey[900],
//         title: const Text(
//           "Save Recording?",
//           style: TextStyle(color: Colors.white),
//         ),
//         content: const Text(
//           "Would you like to keep this recording or discard and re-record?",
//           style: TextStyle(color: Colors.white70),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               _discardRecording();
//               Navigator.pop(context);
//             },
//             child: const Text("Discard", style: TextStyle(color: Colors.redAccent)),
//           ),
//           TextButton(
//             onPressed: () {
//               _saveRecording();
//               Navigator.pop(context);
//             },
//             child: const Text("Save", style: TextStyle(color: Colors.greenAccent)),
//           ),
//         ],
//       ),
//     );
//   }

//   void _discardRecording() {
//     if (_filePath != null && File(_filePath!).existsSync()) {
//       File(_filePath!).deleteSync();
//     }

//     setState(() {
//       _filePath = null;
//       _hasRecorded = false;
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Recording discarded.')),
//     );
//   }

//   void _saveRecording() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Recording saved in Downloads folder.')),
//     );
//   }

//   @override
//   void dispose() {
//     _levelTimer?.cancel();
//     _recorder.dispose();
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Lung Sound Recorder'),
//         backgroundColor: Colors.grey[900],
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Status text
//             Text(
//               _isRecording
//                   ? 'Recording...'
//                   : _hasRecorded
//                       ? 'Recording Complete'
//                       : 'Idle',
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             const SizedBox(height: 30),

//             // Amplitude visualization
//             Container(
//               width: 300,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade900,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 100),
//                   width: double.infinity,
//                   height: _isRecording ? _amplitude * 2 : 0,
//                   color: _isRecording ? Colors.greenAccent : Colors.transparent,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),

//             // Start/Stop Button
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor:
//                     _isRecording ? Colors.redAccent : Colors.greenAccent,
//                 foregroundColor: Colors.black,
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//               ),
//               onPressed: _toggleRecording,
//               child: Text(_isRecording ? 'Stop' : 'Start Recording'),
//             ),
//             const SizedBox(height: 20),

//             // Play and Re-record Buttons (only after recording)
//             if (_hasRecorded) ...[
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   foregroundColor: Colors.white,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 ),
//                 onPressed: _playRecording,
//                 icon: const Icon(Icons.play_arrow),
//                 label: const Text('Play Recording'),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orangeAccent,
//                   foregroundColor: Colors.black,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 ),
//                 onPressed: () {
//                   _discardRecording();
//                   _startRecording();
//                 },
//                 icon: const Icon(Icons.refresh),
//                 label: const Text('Re-record'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
