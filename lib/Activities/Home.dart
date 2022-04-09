import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:provider/provider.dart';
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
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<AppModel>(context, listen: false).updateTitle("NEW PRODUCT UPLOAD");
                        setState(() {

                        });
                      },
                      child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    "assets/box.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('New Product Upload'),
                              ],
                            ),
                          )),
                    ),
                    /*InkWell(
                      onTap: () {
                        Provider.of<AppModel>(context, listen: false).updateTitle("NEW COLLECTION NAME");

                      },
                      child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    "assets/box.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('New Collection name'),
                              ],
                            ),
                          )),
                    ),*/
                    InkWell(
                      onTap: () {
                        Provider.of<AppModel>(context, listen: false).updateTitle("READY STOCK");
                        setState(() {

                        });
                      },
                      child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    "assets/box.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('Ready Stock'),
                              ],
                            ),
                          )),
                    ),InkWell(
                      onTap: () {
                        Provider.of<AppModel>(context, listen: false).updateTitle("ORDER STOCK");
                        setState(() {

                        });
                      },
                      child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    "assets/box.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('Order Stock'),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Login();
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }
}
