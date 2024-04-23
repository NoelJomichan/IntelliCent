import 'package:flutter/material.dart';
import 'package:untitled/Screens/chatbot.dart';
import 'package:untitled/Screens/data_page.dart';
import 'package:untitled/Screens/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Color myColor;
  double screenHeight = 0;
  double screenWidth = 0;

  int currentIndex = 1;

  List<IconData> navigationIcons = [
    Icons.chat_bubble_outline_sharp,
    Icons.document_scanner_outlined,
    Icons.person_2_outlined
  ];


  @override
  Widget build(BuildContext context) {
    myColor = Colors.blueGrey;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          new ChatBot(),
          new DataPage(),
          new ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 24
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2)
              )
            ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < navigationIcons.length; i++)...<Expanded>{
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndex = i;
                        });
                      },
                      child: Container(
                        height: screenHeight,
                        width: screenWidth,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                navigationIcons[i],
                                size: i == currentIndex ? 30 : 26,
                                color: i == currentIndex ? myColor : Colors.black,
                              ),
                              i == currentIndex ? Container(
                                margin: const EdgeInsets.only(top: 6),
                                height: 3,
                                width: 22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
                                  color: myColor,
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ))
              }
            ],
          ),
        ),
      ),
    );
  }
}
