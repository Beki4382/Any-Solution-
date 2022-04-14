import 'package:flutter/material.dart';
import 'package:signup_login/input_form.dart';
import 'package:signup_login/login_theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 198, 209),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          iconSize: 35.0,
          color: Colors.white,
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ),
      body: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var outlineInputBorder = OutlineInputBorder(
    gapPadding: 8,
    borderSide:
        const BorderSide(width: 1.2, color: Color.fromARGB(255, 9, 144, 153)),
    borderRadius: BorderRadius.circular(40),
  );
  bool isFocus = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          // start .. container of header login text
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 5),
            alignment: Alignment.center,
            child: Text(
              "Create Account",
              style: LoginTheme.textTheme.headline1,
            ),
          ),

          // end .. container of header login text

          // start .. container of fill form text
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
            alignment: Alignment.center,
            child: Text(
              "Please fill the form below here",
              style: LoginTheme.textTheme.headline3,
            ),
          ),
          // end .. container of fill form text
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: Column(children: [
              inputForm(
                  Icons.person_outline, "Full Name", "Enter your full name"),
              inputForm(
                  Icons.email_outlined, "Email", "Enter your email account"),
              inputForm(Icons.lock_outline_rounded, "Password",
                  "Enter your password"),
              inputForm(Icons.lock_outline_rounded, "Confirm Password",
                  "Confirm your password"),
            ]),
          ),
          // start ...login button container
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 65),
                    primary:
                        const Color.fromARGB(255, 56, 231, 243), // background
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))
                    // foreground
                    ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text("SignUp", style: LoginTheme.textTheme.headline1),
              )),

          // end ... login button container
          // Start  ... don't have an account
          // Start  ... don't have an account
          Container(
            margin: const EdgeInsets.only(bottom: 50, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: LoginTheme.textTheme.headline3),
                TextButton(
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign in",
                      style: LoginTheme.textTheme.headline5,
                    )),
              ],
            ),
          ),
          // end  ... don't have an account

          // end  ... don't have an account
        ],
      ),
    );
  }

  // start input field widget
  Widget inputForm(IconData icon, String inputName, String hint) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextFormField(
        obscureText: inputName == "Password" || inputName == "Confirm Password",
        keyboardType: inputName == "Email"
            ? TextInputType.emailAddress
            : TextInputType.text,
        showCursor: true,
        style: LoginTheme.textTheme.headline2,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 16),
          border: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          hintText: hint,
          hintStyle: LoginTheme.textTheme.headline4,
          labelText: inputName,
          labelStyle: LoginTheme.textTheme.headline3,
        ),
        onSaved: (String? value) {},
        controller: (inputName == "Password")
            ? _pass
            : (inputName == "Confirm Password")
                ? _confirmPass
                : null,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '$inputName can not be empty';
          }
          if (value.length < 5) {
            return '$inputName can not be less than 5 characters';
          }
          if (inputName == "Confirm Password" && value != _pass.text) {
            return "Password do not match";
          }
          if ((inputName == "Email") &&
              (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value))) {
            return 'Please enter a valid Email';
          }
          return null;
        },
      ),
    );
  }
}
