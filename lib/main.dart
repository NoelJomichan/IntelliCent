import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/Screens/chatbot.dart';
import 'package:untitled/Screens/data_page.dart';
import 'package:untitled/Screens/home_page.dart';
import 'package:untitled/Screens/login.dart';
import 'package:untitled/Screens/profile_page.dart';
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
      initialRoute: HomePage.id,
      routes: {
        DataPage.id: (context) => const DataPage(),
        ChatBot.id: (context) => const ChatBot(),
        ProfilePage.id: (context) => const ProfilePage(),
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage()


    });
  }
}