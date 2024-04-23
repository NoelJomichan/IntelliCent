import 'dart:convert';
import 'package:flutter/material.dart';

import '../Python/userData.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String id = 'profile page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    // Simulating loading JSON from local assets (replace with your actual data source)
    String data = await DefaultAssetBundle.of(context).loadString('assets/user.json');
    final jsonResult = jsonDecode(data)['users'];
    setState(() {
      _users = List<User>.from(jsonResult.map((x) => User.fromJson(x)));
    });
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
        appBar: AppBar(
          title: const Text('Profile Page'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: _users.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(_users[index].username),
                subtitle: Text('Savings: ${_users[index].savings} - Risk: ${_users[index].risk}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
