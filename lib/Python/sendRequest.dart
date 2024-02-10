
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendPostRequest(
    age, income, fixedExpense, dependentCount,  dailyNeeds, transportation, foodBev, healthcare, shopping,
    services, other, gender, maritalStatus, professionIndustrial, professionKnowledge, professionPublic,
    professionService)  async {
  print('reached');
  final Map<String, dynamic> inputData = {
    "Age": age,
    "Income": income,
    "Fixed Expenses": fixedExpense,
    "Dependent Count": dependentCount,
    "Marital Status": maritalStatus,
    "Daily Needs": dependentCount,
    "Transportation": transportation,
    "Food and Bev": foodBev,
    "Healthcare": healthcare,
    "Shopping": shopping,
    "Services": services,
    "Other": other,
    "Profession_Industrial": professionIndustrial,
    "Profession_Knowledge": professionKnowledge,
    "Profession_Public": professionPublic,
    "Profession_Service": professionService,
    "Gender_Male": gender
  };
  final url = Uri.parse('http://192.168.31.91:5000/predict'); // Replace with the API URL
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
