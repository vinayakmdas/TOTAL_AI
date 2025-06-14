import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiApiService {
  final String apiKey;

  GeminiApiService({required this.apiKey});

  Future<String> sendMessage(String userInput) async {
    final String url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": userInput},
          ],
        },
      ],
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final reply = data['candidates'][0]['content']['parts'][0]['text'];
        return reply;
      } else {
        return "API Error: ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
