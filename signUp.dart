import 'package:flutter/material.dart';
import 'package:mob/main.dart';

class SignUP extends StatefulWidget {
  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sacaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: const Color(0xffE7F2F8),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "AAiT Stack Overflow",
          ),
        ),
        backgroundColor: const Color(0xff74BDCB),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          const Center(
            child: Text(
              "Sign In",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    color: Color(0xff74BDCB),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          labelText: "enter your name",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "name can not be empty";
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    color: Color(0xff74BDCB),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            border: InputBorder.none,
                            labelText: "enter your email",
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email can't be empity";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    color: Color(0xff74BDCB),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            border: InputBorder.none,
                            labelText: "enter your password",
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can't be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          RaisedButton(
              splashColor: Color.fromARGB(255, 36, 193, 224),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(20.0),
              child: Text("sign in"),
              color: Color(0xff74BDCB),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final snackBar = SnackBar(
                      content: Text(
                    'submitting form',
                  ));
                  _sacaffoldkey.currentState!.showSnackBar(snackBar);
                }
              }),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account"),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                    splashColor: Color.fromARGB(255, 36, 193, 224),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.all(20.0),
                    child: Text("log in"),
                    color: Color(0xff74BDCB),
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
