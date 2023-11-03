// @dart=2.9
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts _flutterTts;
  static bool isPlaying = false;

  static Future speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1) isPlaying = true;
    }
  }

  static initializeTts() {
    _flutterTts = FlutterTts();
    setTtsLanguage();
    _flutterTts.setStartHandler(() {
      isPlaying = true;
    });

    _flutterTts.setCompletionHandler(() {
      isPlaying = false;
    });

    _flutterTts.setErrorHandler((err) {
      print("error occurred: " + err);
      isPlaying = false;
    });
  }

  static void setTtsLanguage() async {
    await _flutterTts.setLanguage("pt-BR");
  }

  static Future stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) isPlaying = false;
  }
}
