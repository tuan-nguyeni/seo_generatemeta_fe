import 'package:flutter/foundation.dart';

class EnvHelper {
  static String get baseUrl {
    if (kReleaseMode) {
      return 'https://seo-generatemeta-be-bc08e0e40826.herokuapp.com/generate-meta';
    } else {
      return 'http://localhost:5002/generate-meta';
    }
  }
}
