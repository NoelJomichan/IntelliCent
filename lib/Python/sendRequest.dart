import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendPostRequest() async {
  final url = Uri.parse('http://192.168.243.100:5000/predict'); // Replace with the API URL

  final Map<String, dynamic> inputData = {
    "Age": 24,
    "Income": 173000,
    "Fixed Expenses": 71000,
    "Dependent Count": 4,
    "Marital Status": 1,
    "Daily Needs": 8700,
    "Transportation": 8300,
    "Food and Bev": 9300,
    "Healthcare": 3600,
    "Shopping": 18000,
    "Services": 9600,
    "Other": 12000,
    "Profession_Industrial": 1,
    "Profession_Knowledge": 0,
    "Profession_Public": 0,
    "Profession_Service": 0,
    "Gender_Male": 1
  };

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(inputData),
  );
  if (response.statusCode == 200) {
    final responseMap = jsonDecode(response.body);
    final predictedSavings = responseMap['predicted_savings'];
    print("Predicted Savings: $predictedSavings");
  } else {
    print("Request failed with status: ${response.statusCode}");
  }
}
