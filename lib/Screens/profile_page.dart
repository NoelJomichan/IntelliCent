import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Python/userData.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String id = 'profile page';


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<User> _users = [];
  late Map<String, dynamic> userData;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  loadUserData() async {

    String username = 'saurav';
    String url = 'http://10.0.2.2:7000/get-data?username=$username';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Parse the JSON response into a Dart Map
        userData = json.decode(response.body);

        // Call setState to update the UI with the fetched data
        setState(() {});
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
    }

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
          child: const Icon(Icons.refresh),
          onPressed: ()async{
            loadUserData();
          },
        ),
        appBar: AppBar(
          title: const Text('Profile Page'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Center(
          child: userData == null
          ? CircularProgressIndicator()
          :Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.blue,
                child: Text('API Key: ${userData['api_key']}'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.green,
                child: Text('Username: ${userData['username']}'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.yellow,
                child: Text('Savings: ${userData['savings']}'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.orange,
                child: Text('Risk: ${userData['risk']}'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red,
                child: Text('Duration: ${userData['duration']}'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.purple,
                child: Text('Expected Returns: ${userData['expected_returns']}'),
              ),
            ],
          ),
        )
      ),
    );
  }
}
