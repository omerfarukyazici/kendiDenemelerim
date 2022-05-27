import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:refikaref/chat_screen.dart';
import 'package:refikaref/login.dart';

class Service {
  //nu seribsle aut işlerini yapacağz
  final auth = FirebaseAuth.instance;

// kullanıcı yaratma fonks

  void createUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ))
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

//oturum açma fonks
  void loginUser(context, email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()))
      });
    } catch (e) {
      errorBox(context, e);
    }
  }

//çıkış fonk
  void signOut(context) async {
    try {

      await auth.signOut().then((value) =>{
        Navigator.push(context,
            MaterialPageRoute(builder:
            (context) => LoginPage()),

        )} );
    } catch (e) {
      errorBox(context, e);
    }
  }

//hata gösterme fonsk
  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.toString())
          );
        });
  }
}
