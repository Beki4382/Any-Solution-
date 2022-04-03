import 'package:flutter/material.dart';
import 'package:mob/signUp.dart';

void main() {
  runApp(
    MaterialApp(
      home: SignUP(),
    ),
  );
}

class signInPage extends StatefulWidget {
  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F2F8),
      appBar: AppBar(
          title: const Center(
            child: Text(
              "AAiT Stack Overflow",
            ),
          ),
          backgroundColor: const Color(0xff74BDCB)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            child: Image(
              image: AssetImage('assets/stack1.jpg'),
            ),
            radius: 70.0,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                // controller: _namecontrller,
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    icon: Icon(
                      Icons.email,
                    ),
                    iconColor: Colors.black,
                    border: InputBorder.none),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
            ),
            color: Color(0xff74BDCB),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    icon: Icon(Icons.lock),
                    iconColor: Colors.black,
                    border: InputBorder.none),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
            ),
            color: Color(0xff74BDCB),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
