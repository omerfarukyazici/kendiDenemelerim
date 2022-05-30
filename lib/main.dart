import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:refikaref/Screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_and_realtime_database/login.dart';

main() async {
  //burada kullancı emaili gncel mi diye kontol edeceğiz
  //sonra chat ekranı ya da logine gidecek
  //burada uygulama yendien başlatığıdında giriş ekranına gidecek


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString("email");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    //eğer email girilyse sohbete değilse girişe yollucak
    home: email == null? LoginPage(): const HomePage() ,
  ));
}
