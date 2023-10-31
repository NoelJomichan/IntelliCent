import 'package:flutter/material.dart';
import 'package:untitled/Python/sendRequest.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           sendPostRequest();
        },
      ),
      backgroundColor: Colors.blueGrey[100],
    );
  }
}
