import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/chatbot.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late SharedPreferences sharedPreferences;

  late Color myColor = Colors.blue;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.currency_exchange,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "INTELLICENT",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Please login with your information"),
        const SizedBox(height: 60),

        _buildInputField("Email address",emailController),
        const SizedBox(height: 40),

        _buildInputField("Password", passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(() async{
          FocusScope.of(context).unfocus();
          String id = emailController.text.trim();
          String password = passwordController.text.trim();


          if (id.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('ID is still Empty!'))
            );
          }else if(password.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Password is still Empty!'))
            );
          }else{
            QuerySnapshot snap = await FirebaseFirestore.instance
                .collection("user").where('id', isEqualTo: id).get();
            try{
                if (password == snap.docs[0]['password']) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatBot())
                    );
                  print('success');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Employee Password is Incorrect!')));
                }
            }catch (e){
                String error = ' ';
                if(e.toString() == 'RangeError (index): Invalid value: Valid value range is empty: 0'){
                  setState(() {
                    error = 'Employee ID does not exist!';
                  });
                }else{
                  setState(() {
                    error = 'An error occurred!';
                  });
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error))
                );
              }

          }

        }),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(String text, TextEditingController controller,
      {isPassword = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(

        labelText: text,
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText("I forgot my password"))
      ],
    );
  }

  Widget _buildLoginButton(VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: Text(
        "LOGIN",
        style: TextStyle(
          color: myColor,
        ),
      ),
    );
  }

}