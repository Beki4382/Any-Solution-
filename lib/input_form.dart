import 'package:flutter/material.dart';
import 'package:signup_login/login_theme.dart';

class TextForm extends StatefulWidget {
  TextForm({Key? key, this.icon, this.hint, this.inputName}) : super(key: key);
  IconData? icon;
  String? inputName;
  String? hint;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  var pass = '';

  var outlineInputBorder = OutlineInputBorder(
    gapPadding: 8,
    borderSide:
        const BorderSide(width: 1.2, color: Color.fromARGB(255, 9, 144, 153)),
    borderRadius: BorderRadius.circular(40),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextFormField(
        obscureText: widget.inputName == "Password" ||
            widget.inputName == "Confirm Password",
        keyboardType: widget.inputName == "Email"
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
              widget.icon,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          hintText: widget.hint,
          hintStyle: LoginTheme.textTheme.headline4,
          labelText: widget.inputName,
          labelStyle: LoginTheme.textTheme.headline3,
        ),
        onSaved: (String? value) {
          if (widget.inputName == "Password") {
            pass = value.toString();
          }
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '${widget.inputName} can not be empty';
          }
          if (value.length < 5) {
            return '${widget.inputName} can not be less than 5 characters';
          }
          if (widget.inputName == "Confirm Password" && value != pass) {
            return ("Password: " + pass + " , Confirm: " + value.toString());
          }
          if ((widget.inputName == "Email") &&
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
