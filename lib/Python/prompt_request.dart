import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> sendPromptToMistral(String prompt) async {
  final url = Uri.parse('http://10.0.2.2:11434/api/generate');
  final body = json.encode({
    "model": "mistral",
    "prompt": prompt,
    "stream": true,
  });

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: body,
  );

  if (response.statusCode == 200) {
    // Request was successful, return the response body
    return response.body;
  } else {
    // Request failed, throw an error or handle accordingly
    throw Exception('Failed to send prompt to Mistral AI');
  }

}
