import 'dart:convert';

import 'package:flutter_openai_demo/constants/open_ai.dart';
import 'package:flutter_openai_demo/models/open_ai.dart';
import 'package:http/http.dart' as http;

class GiftService {
  static void getRecommendations({
    required String relation,
    required String gender,
    required String occasion,
    required String hobbies,
  }) async {
    var url = Uri.parse('https://api.openai.com/v1/completions');

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Authorization': 'Bearer $apiKey'
    };

    String promptData =
        "Suggest gift ideas for someone who is realted to me as $relation of $gender gender for the occasion of $occasion in budget less than 10,000 rupees with $hobbies as hobbies.";

    print(promptData);
    final data = jsonEncode({
      "model": "text-davinci-003",
      "prompt": promptData,
      "temperature": 0.4,
      "max_tokens": 64,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    });

    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      print(response.body);
      final gptData = gptDataFromJson(response.body);
    }
  }
}
