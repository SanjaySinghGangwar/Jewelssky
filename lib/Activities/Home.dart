import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var islogin = false;

  SharedPreferences? preferences;

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        islogin = preferences!.getBool(mSharedPreference().isLogin)!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return islogin
        ? const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Text("HOME"),
            ),
          )
        : Login();
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }
}
