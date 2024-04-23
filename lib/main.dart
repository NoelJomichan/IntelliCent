import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/Screens/chatbot.dart';
import 'package:untitled/Screens/home_screen.dart';
import 'package:untitled/Screens/login.dart';
import 'package:untitled/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
<<<<<<< HEAD
      HomeScreen.id: (context) => const HomeScreen(),
=======
      HomeScreen.id: (context) => const ChatBot(),
>>>>>>> 9b4c775d9a24f4165fa4ed8f6fa24255496981a0
    });
  }
}