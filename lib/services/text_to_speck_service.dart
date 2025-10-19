import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeakService {
  static final FlutterTts _flutterTts = FlutterTts();

  static Future<void> initTTS({String langCode = "ar-EG"}) async {
    await _flutterTts.setLanguage(langCode);
    await _flutterTts.setSpeechRate(0.6);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  static Future<void> speak(String content) async {
    if (content.trim().isEmpty) return;
    await _flutterTts.speak(content);
  }

  static Future<void> stop() async {
    await _flutterTts.stop();
  }

  static Future<void> pause() async {
    await _flutterTts.pause();
  }
}
