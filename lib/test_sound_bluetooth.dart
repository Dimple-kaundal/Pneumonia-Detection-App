import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:external_path/external_path.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LungRecorder(),
  ));
}

class LungRecorder extends StatefulWidget {
  const LungRecorder({super.key});

  @override
  State<LungRecorder> createState() => _LungRecorderState();
}

class _LungRecorderState extends State<LungRecorder> {
  final _recorder = AudioRecorder();
  final _player = AudioPlayer();
  bool _isRecording = false;
  double _amplitude = 0;
  String? _filePath;
  Timer? _levelTimer;

  /// Toggle start/stop recording
  Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _stopRecording();
      return;
    }

    if (!await _recorder.hasPermission()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission denied')),
      );
      return;
    }

    // Use a public folder path (visible in My Files > Downloads)
    final downloadsDir = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOAD,
    );
    final path = '$downloadsDir/lung_bt.wav';
    _filePath = path;

    debugPrint("Saving to: $path");

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.wav,
        sampleRate: 44100,
        bitRate: 128000,
      ),
      path: path,
    );

    // Poll mic amplitude every 100ms
    _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      final amp = await _recorder.getAmplitude();
      setState(() => _amplitude = amp.current.abs().clamp(0, 100));
    });

    setState(() => _isRecording = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Recording started')),
    );
  }

  /// Stop recording
  Future<void> _stopRecording() async {
    await _recorder.stop();
    _levelTimer?.cancel();
    setState(() => _isRecording = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Recording stopped')),
    );
    debugPrint("✅ Recording saved at: $_filePath");
  }

  /// Play last recorded file
  Future<void> _playRecording() async {
    if (_filePath == null || !File(_filePath!).existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No recording found')),
      );
      return;
    }

    try {
      await _player.play(DeviceFileSource(_filePath!));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Playing last recording...')),
      );
    } catch (e) {
      debugPrint(" Error playing file: $e");
    }
  }

  @override
  void dispose() {
    _levelTimer?.cancel();
    _recorder.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Lung Sound Recorder'),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isRecording ? 'Recording...' : '',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 40),

            // Amplitude visualization
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: double.infinity,
                  height: _amplitude * 2,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Start/Stop button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isRecording ? Colors.redAccent : Colors.greenAccent,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: _toggleRecording,
              child: Text(_isRecording ? 'Stop' : 'Start'),
            ),

            const SizedBox(height: 20),

            // Play button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: _playRecording,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play Last Recording'),
            ),
          ],
        ),
      ),
    );
  }
}
