import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeakService {
  static final FlutterTts _flutterTts = FlutterTts();

  /// 🔧 إعداد الإعدادات الأساسية لـ TTS
  static Future<void> initTTS({String langCode = "ar-SA"}) async {
    try {
      await _flutterTts.setLanguage(langCode);
      await _flutterTts.setSpeechRate(0.6); // سرعة الكلام
      await _flutterTts.setVolume(1.0);     // مستوى الصوت
      await _flutterTts.setPitch(1.0);      // طبقة الصوت
    } catch (e) {
      print("⚠️ Error initializing TTS: $e");
    }
  }

  /// 🗣️ نطق النص
  static Future<void> speak(String content) async {
    try {
      if (content.trim().isEmpty) return;
      await _flutterTts.speak(content);
    } catch (e) {
      print("⚠️ Error speaking text: $e");
    }
  }

  /// ⏹️ إيقاف الصوت
  static Future<void> stop() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      print("⚠️ Error stopping TTS: $e");
    }
  }

  /// 🧹 إلغاء أي نطق جاري
  static Future<void> pause() async {
    try {
      await _flutterTts.pause();
    } catch (e) {
      print("⚠️ Error pausing TTS: $e");
    }
  }
}
