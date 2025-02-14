import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

class CustomPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level];
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final timestamp =
        DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(DateTime.now());

    final buffer = StringBuffer();
    buffer.writeln('');
    buffer.writeln('📌 [$timestamp] $emoji ${event.level.name.toUpperCase()}');
    buffer.writeln(event.message);
    buffer.writeln('════════════════════════════════════════════════════\n');

    return [color!(buffer.toString())];
  }
}
