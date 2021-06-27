import 'package:bulacan/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController repeatpassword = TextEditingController();

  Future register(BuildContext cont) async {
    if (username.text == "" ||
        email.text == "" ||
        password.text == "" ||
        repeatpassword.text == "") {
      Fluttertoast.showToast(
        msg: "All fields cannot be blank!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
      if (password.text == repeatpassword.text) {
        var url =
            "http://192.168.0.11/localhost/xampp/localconnect/db_signup.php";
        var response = await http.post(Uri.file(url), body: {
          "username": username.text,
          "email": email.text,
          "password": password.text,
        });

        var data = json.decode(response.body);
        if (data == "success") {
          Fluttertoast.showToast(
            msg: "Registration success!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
          Navigator.push(
              cont, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Fluttertoast.showToast(
            msg: "Registration failed!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Both password have to be the same!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_img.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.black,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up Form",
                style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: repeatpassword,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: "Repeat Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 15.0),
              ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: () {
                      register(context);
                    },
                    child: Text("SIGN UP"),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    color: Colors.green,
                  )),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
