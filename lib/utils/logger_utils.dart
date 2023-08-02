import 'package:logger/logger.dart';

/// A Logger which serves as a way to log a given event from anywhere.
class LoggerUtils {
  static final Logger _logger = Logger(
      printer: PrettyPrinter(colors: true, printEmojis: true, methodCount: 0),
      level: Level.debug);

  static Logger get logger => _logger;
}
