
// lib/record.dart

class Record {
  final String filePath;
  final DateTime timestamp;

  Record({
    required this.filePath,
    required this.timestamp,
  });

  // If you want JSON support for saving to DB or cloud
  Map<String, dynamic> toJson() {
    return {
      'filePath': filePath,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      filePath: json['filePath'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
