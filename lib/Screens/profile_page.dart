import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String id = 'profile page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Map<String, dynamic> userData;
  late String? username;

  late SharedPreferences sharedPreferences;

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  loadUserData() async {
    String url = 'http://10.0.2.2:7000/get-data?username=$username';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        userData = json.decode(response.body);
        setState(() {});
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  void initState() {
    super.initState();
    initSharedPreferences().then((_) {
      username = sharedPreferences.getString('username');
      loadUserData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IntelliCent',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Open Sans',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            primary: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.refresh),
            onPressed: () async {
              loadUserData();
            },
          ),
          appBar: AppBar(
            title: const Text('Profile Page'),
            backgroundColor: Colors.blueGrey[800],
          ),
          body: Center(
            child: userData == null
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            )
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextSpan(
                          text: userData['username'],
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Your details are:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  _buildDataContainer('Savings', userData['savings']),
                  _buildDataContainer('Risk', userData['risk']),
                  _buildDataContainer('Duration (years)', userData['duration']),
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget _buildDataContainer(String title, dynamic value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Text('$title: $value', style: TextStyle(fontSize: 21, color: Colors.black)),
    );
  }
}