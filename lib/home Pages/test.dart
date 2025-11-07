// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// /// Recording states
// enum RecordingState {
//   idle,
//   recording,
//   recorded,
//   listening,
// }

// /// Notifier to manage recording state
// class RecordingNotifier extends StateNotifier<RecordingState> {
//   RecordingNotifier() : super(RecordingState.idle);

//   void startRecording() => state = RecordingState.recording;
//   void stopRecording() => state = RecordingState.recorded;
//   void startListening() => state = RecordingState.listening;
//   void stopListening() => state = RecordingState.recorded; // back after listen
//   void save() => state = RecordingState.idle;
//   void discard() => state = RecordingState.idle;
// }

// /// Provider
// final recordingProvider =
//     StateNotifierProvider<RecordingNotifier, RecordingState>(
//   (ref) => RecordingNotifier(),
// );

// /// Main App
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pneumonia Detection',
//       debugShowCheckedModeBanner: false,
//       home: const RecordingScreen(),
//     );
//   }
// }

// class RecordingScreen extends ConsumerWidget {
//   const RecordingScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final recordingState = ref.watch(recordingProvider);
//     final notifier = ref.read(recordingProvider.notifier);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Lung Sound Recorder"),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Top section: Waveform animation while recording
//           if (recordingState == RecordingState.recording) ...[
//             const Text("Recording...", style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             const WaveformAnimation(),
//           ],
//           if (recordingState == RecordingState.idle) ...[
//             const Text("Tap start to record", style: TextStyle(fontSize: 16)),
//           ],
//           if (recordingState == RecordingState.recorded) ...[
//             ElevatedButton(
//               onPressed: notifier.startListening,
//               child: const Text("▶ Listen"),
//             ),
//           ],
//           if (recordingState == RecordingState.listening) ...[
//             const Text("Playing recorded audio..."),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                   onPressed: notifier.save,
//                   child: const Text("Save"),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   onPressed: notifier.discard,
//                   child: const Text("Discard"),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//       // Bottom control buttons
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Start button (only when idle)
//             if (recordingState == RecordingState.idle)
//               ElevatedButton.icon(
//                 icon: const Icon(Icons.mic),
//                 label: const Text("Start"),
//                 onPressed: notifier.startRecording,
//               )
//             else
//               const SizedBox.shrink(),

//             // Stop button (only when recording)
//             if (recordingState == RecordingState.recording)
//               ElevatedButton.icon(
//                 icon: const Icon(Icons.stop),
//                 label: const Text("Stop"),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                 onPressed: notifier.stopRecording,
//               )
//             else
//               const SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Fake waveform animation widget
// class WaveformAnimation extends StatefulWidget {
//   const WaveformAnimation({super.key});

//   @override
//   State<WaveformAnimation> createState() => _WaveformAnimationState();
// }

// class _WaveformAnimationState extends State<WaveformAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1))
//           ..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(6, (index) {
//               final height = (20 + 40 * _controller.value * (index % 2 + 1));
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4),
//                 child: Container(
//                   width: 6,
//                   height: height,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//               );
//             }),
//           );
//         },
//       ),
//     );
//   }
// }
