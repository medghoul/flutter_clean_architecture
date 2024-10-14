import 'package:flutter/material.dart';
import 'package:clean_architecture/core/resources/utils/logger_ext.dart';
import 'package:logger/logger.dart';

class LogTile extends StatelessWidget {
  const LogTile({required this.event, super.key});

  final LogEvent event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${event.level.emoji} ${event.level.name}'),
            if (event.message != null) Text('${event.message}'),
            if (event.error != null) Text('${event.error}'),
            if (event.stackTrace != null) Text('${event.stackTrace}'),
            Text('${event.time}'),
          ],
        ),
      ),
    );
  }
}
