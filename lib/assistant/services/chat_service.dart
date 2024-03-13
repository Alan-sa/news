import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String apiKey = '';
  final String apiUrl = 'https://api.openai.com/v1/completions';

  Future<String> getResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'prompt': prompt,
        'max_tokens': 250,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['choices'][0]['text'];
    } else {
      throw Exception('Failed to load data from the OpenAI API');
    }
  }
}
