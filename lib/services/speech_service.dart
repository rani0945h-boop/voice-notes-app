//Handle speech-to-text functionality using the speech_to_text package.
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  bool get isListening => _isListening;
  String get text => _text;

  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  void startListening() {
    _isListening = true;
    _text = '';
    _speech.listen(
      onResult: (result) {
        _text = result.recognizedWords;
      },
    );
  }

  void stopListening() {
    _isListening = false;
    _speech.stop();
  }
}