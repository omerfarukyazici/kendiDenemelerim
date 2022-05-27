import 'package:flutter/material.dart';
import 'package:refikaref/firebase_helper.dart';
import 'package:refikaref/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  controller: emailController,
                  //emaiş girişi bıradan uapılıyo
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 80)),
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    if (emailController.text.toString().isNotEmpty &&
                        passwordController.text.toString().isNotEmpty) {
                      //boşsa girmeyecek
                      service.loginUser(
                          context,
                          emailController.text.toString(),
                          passwordController.text.toString()
                      );

//burasıemail kayıtlıe mailse chate yollucak değilse de giriş ekranına yolucak

                      pref.setString("email", emailController.text.toString());
                    } else {
                      service.errorBox(context,
                          "Fields must not empty please valid email and password");
                    }
                  },
                  child: const Text("Login ")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                  },
                  child: const Text("I don't have acaaount"))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("ChatApp"),
      ),
    );
  }
}
