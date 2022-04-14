import 'package:flutter/material.dart';
import 'package:signup_login/login_theme.dart';
import 'input_form.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isFocus = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            ListView(children: <Widget>[
              // Start ... Image at head
              Container(
                constraints: BoxConstraints.expand(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
                color: const Color.fromARGB(255, 56, 231, 243),
                child: const Image(
                    image: AssetImage('assets/stack8.png'),
                    fit: BoxFit.contain),
              ),
              // End ... Image at head

              // Start ... login header and fill text start
              Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Login", style: LoginTheme.textTheme.headline1),
                      Text(
                        "Please fill the form below here",
                        style: LoginTheme.textTheme.headline3,
                      ),

                      // End... login header and fill text start

                      // start.. form inputs email and password
                      TextForm(
                          icon: Icons.email_outlined,
                          inputName: "Email",
                          hint: "Enter your email account"),
                      TextForm(
                          icon: Icons.lock_outline_rounded,
                          inputName: "Password",
                          hint: "Enter your password"),

                      // End.. form inputs email and password

                      // start ...login button container
                      Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 65),
                                primary: const Color.fromARGB(
                                    255, 56, 231, 243), // background
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))
                                // foreground
                                ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: Text("Login",
                                style: LoginTheme.textTheme.headline1),
                          )),

                      // end ... login button container

                      // start ... forget password
                      Center(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: LoginTheme.textTheme.headline5,
                              ))),
                    ]),
              ),
              // end ... forget password

              // Start  ... don't have an account
              Container(
                margin: const EdgeInsets.only(bottom: 50, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: LoginTheme.textTheme.headline3),
                    TextButton(
                        onPressed: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pushNamed(context, '/second');
                        },
                        child: Text(
                          "Sign Up",
                          style: LoginTheme.textTheme.headline5,
                        )),
                  ],
                ),
              ),
              // end  ... don't have an account
            ]),
          ],
        ),
      ),
    );
  }
}
