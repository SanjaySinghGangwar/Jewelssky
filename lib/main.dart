import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:provider/provider.dart';

import 'Activities/CustomMenuDashBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppModel()),
      ],
      child: MaterialApp(
        color: Colors.white,
        title: mUtis().appName,
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
