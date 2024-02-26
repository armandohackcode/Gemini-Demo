import 'package:app_demo_gemini/config/helpers/key_gemini.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:app_demo_gemini/domain/domain.dart';

class CustomGemini {
  static GenerationConfig get _generationConfig => GenerationConfig(
        stopSequences: ["red"],
      );
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: apikey,
    generationConfig: _generationConfig,
  );

  Future<AppResponse?> generateResponse(
      {required List<AppResponse> list, required String newText}) async {
    try {
      List<Content> history = [];
      if (list.length > 1) {
        var newList = list.sublist(0, list.length - 1).toList();
        var resUsers = newList
            .where((item) => item.user == Users.user)
            .map((e) => TextPart(e.detail));
        history.add(Content.multi(resUsers));
        var resModel = newList
            .where((item) => item.user == Users.gemini)
            .map((e) => TextPart(e.detail));
        history.add(Content.model(resModel));
      }
      final chat = model.startChat(history: history);

      var content = Content.text(newText);
      var response = await chat.sendMessage(content);
      return AppResponse(user: Users.gemini, detail: response.text ?? "");
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
