// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Recording%20State/recording_notifier.dart';
import 'package:flutter_application_1/Recording%20State/recording_state.dart';
import 'package:flutter_application_1/home%20Pages/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pneumonia Detection',
      debugShowCheckedModeBanner: false,
      home: const RecordingScreen(),
    );
  }
}

class RecordingScreen extends ConsumerWidget {
  const RecordingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordingState = ref.watch(recordingProvider);
    final notifier = ref.read(recordingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lung Sound Recorder"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (recordingState == RecordingState.recording) ...[
            const Text("Recording...", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const WaveformAnimation(), // 👈 waveform shows when recording
          ],
          if (recordingState == RecordingState.idle) ...[
            Center(
              child: const Text(
                "Tap mic button to start recording",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
          if (recordingState == RecordingState.recorded) ...[
            Center(
              child: const Text(
                "Recording finished. Tap Listen below.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
          if (recordingState == RecordingState.listening) ...[
            Center(child: ListeningAnimation()),
          ],
        ],
      ),

      /// Curved bottom bar with buttons
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 160,
        decoration: const BoxDecoration(
          color: Color(0xFF1F4BD3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(150),
            topRight: Radius.circular(150),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left circular button (Listen / Save)
            GestureDetector(
              onTap: () {
                if (recordingState == RecordingState.recorded) {
                  notifier.startListening();
                } else if (recordingState == RecordingState.listening) {
                  notifier.save();
                }
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  recordingState == RecordingState.recorded
                      ? Icons
                            .play_arrow // Listen
                      : recordingState == RecordingState.listening
                      ? Icons
                            .save // Save
                      : Icons.description,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),

            // Middle mic button (Start/Stop toggle)
            GestureDetector(
              onTap: () {
                if (recordingState == RecordingState.idle) {
                  notifier.startRecording();
                } else if (recordingState == RecordingState.recording) {
                  notifier.stopRecording();
                }
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: recordingState == RecordingState.recording
                      ? Colors.red
                      : Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  recordingState == RecordingState.recording
                      ? Icons.stop
                      : Icons.mic,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),

            // Right circular button (Settings → Save/Discard popup)
            // Right circular button (Settings → Save/Discard popup only after listening)
            GestureDetector(
              onTap: () {
                if (recordingState == RecordingState.listening) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Save recording?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            notifier.save();
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        ),
                        TextButton(
                          onPressed: () {
                            notifier.discard();
                            Navigator.pop(context);
                          },
                          child: const Text("Discard"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Waveform animation widget
class WaveformAnimation extends StatefulWidget {
  const WaveformAnimation({super.key});

  @override
  State<WaveformAnimation> createState() => _WaveformAnimationState();
}

class _WaveformAnimationState extends State<WaveformAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              final height = (20 + 40 * _controller.value * (index % 2 + 1));
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: 6,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
