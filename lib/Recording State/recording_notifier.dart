import 'package:flutter_application_1/Recording%20State/recording_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordingNotifier extends StateNotifier<RecordingState> {
  RecordingNotifier() : super(RecordingState.idle);

  void startRecording() => state = RecordingState.recording;
  void stopRecording() => state = RecordingState.recorded;
  void startListening() => state = RecordingState.listening;
  void stopListening() => state = RecordingState.recorded; // back after listen
  void save() => state = RecordingState.idle;
  void discard() => state = RecordingState.idle;
}

/// Provider
final recordingProvider =
    StateNotifierProvider<RecordingNotifier, RecordingState>(
      (ref) => RecordingNotifier(),
    );
