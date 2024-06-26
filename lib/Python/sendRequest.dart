import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendPostRequest(
    age, income, fixedExpense,  dailyNeeds, transportation, foodBev, healthcare, shopping,
    services, other, professionIndustrial, professionKnowledge, professionPublic,
    professionService, username)  async {
  print('reached');
  final Map<String, dynamic> inputData = {
    "Age": age,
    "Income": income,
    "Fixed Expenses": fixedExpense,
    "Daily Needs": dailyNeeds,
    "Transportation": transportation,
    "Food and Bev": foodBev,
    "Healthcare": healthcare,
    "Shopping": shopping,
    "Services": services,
    "Other": other
  };
  final url = Uri.parse('http://192.168.153.100:5000/predict?username=$username'); // Replace with the API URL
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(inputData),
  );

  if (response.statusCode == 200) {
    final responseMap = jsonDecode(response.body);
    final predictedSavings = responseMap['predicted_savings'];


    print("Predicted Savings: $predictedSavings");
    return predictedSavings;
  } else {
    print("Request failed with status: ${response.statusCode}");
    return Text('Failed');
  }

}
