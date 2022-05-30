import 'package:flutter/material.dart';
import 'package:refikaref/auth_and_realtime_database/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_helper.dart';


class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //burada servis kalassının instancelerini koyacağız

  Service service = Service();

  RegisterPage({Key? key}) : super(key: key);

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
                "Register Page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  controller: emailController,
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
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      //boşsa girmeyecek
                      service.createUser(context, emailController.text.toString(), passwordController.text.toString());

                  //yine aynı şeyi yapıcaz eğer o andaki açık mailse sohbete yollucak değilse kayıt ekranına

                      pref.setString("email", emailController.text.toString());



                    } else {
                      service.errorBox(context, "Fields must not empty"
                          "please valid email and ");

                    }
                  },
                  child: const Text("Login ")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: const Text("Already have account"))
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
