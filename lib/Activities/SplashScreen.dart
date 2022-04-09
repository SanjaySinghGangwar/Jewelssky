import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:provider/provider.dart';

import 'CustomMenuDashBoard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var android = false;
  var isLoading = false;

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);

    super.initState();
    if (Platform.isAndroid) {
      android = true;
    } else if (Platform.isIOS) {
      android = false;
    }

    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AppModel()),
            ],
            child: MaterialApp(
              color: Colors.white,
              title: 'Nish Hair',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.red,
              ),
              home: CustomMenuDashBoard(),
              //home: MyAppHome(),
              //home: MainWidget(),
            ),
          )
        : android
            ? MaterialApp(
                home: Scaffold(
                  backgroundColor: mUtis().backgroundColor,
                  body: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(70.0),
                        child: Image.asset(
                          "assets/icon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => AppModel()),
                ],
                child: MaterialApp(
                  color: Colors.white,
                  title: 'Nish Hair',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: Colors.red,
                  ),
                  home: CustomMenuDashBoard(),
                  //home: MyAppHome(),
                  //home: MainWidget(),
                ),
              );
  }
}
