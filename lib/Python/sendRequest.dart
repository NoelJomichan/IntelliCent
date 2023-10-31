import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendPostRequest() async {
  final url = Uri.parse('http://192.168.243.100:5000/predict');
  final Map<String, dynamic> inputData = {
  'Age': [25],
  'Income': [75000],
  'Fixed Expenses': [32000],
  'Dependent Count': [2],
  'Marital Status' : [1],
  'Daily Needs': [4000],
  'Transportation': [3000],
  'Food and Bev': [3000],
  'Healthcare': [2000],
  'Shopping': [8500],
  'Services': [4500],
  'Other': [5300],
  'Profession_Industrial': [0],
  'Profession_Knowledge': [0],
  'Profession_Public': [0],
  'Profession_Service': [1],
  'Gender_Male': [1]
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
    return predictedSavings;
  } else {
    print("Request failed with status: ${response.statusCode}");
  }
}
