import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/createProductUpload.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/Activities/OrderStock/OrderStock.dart';
import 'package:jewelssky/Activities/ReadyStock/ReadyStock.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
import 'NewCollectionName/NewCollectionName.dart';

class WebHome extends StatefulWidget {
  @override
  _WebHomeState createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  bool isLoading = false;
  bool isLogin = false;
  var email;
  var name;

  SharedPreferences? preferences;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FullScreen.exitFullScreen();
    initializePreference().whenComplete(() {
      setState(() {
        isLogin = preferences!.getBool(mSharedPreference().isLogin)!;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppModel>(context, listen: true);
    return isLoading
        ? Loader()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                Provider.of<AppModel>(context, listen: true).getappBarTitle.toString() == "LOGOUT" ? "LOGIN" : Provider.of<AppModel>(context, listen: true).getappBarTitle,
                style: TextStyle(color: mUtis().white),
              ),
              centerTitle: true,
              backgroundColor: mUtis().backgroundColor,
              elevation: 0,
              leading: IconButton(
                  color: mUtis().white,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    SimpleHiddenDrawerController.of(context).toggle();
                  }),
              actions: <Widget>[
                /*IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: mUtis().black,
                  ),
                  onPressed: () {
                    app.updateTitle("CART");
                  },
                ),*/
              ],
            ),
            body: condition(Provider.of<AppModel>(context, listen: true).getappBarTitle, context),
            //Home(context),
          );
  }

  Widget condition(String flag, BuildContext context) {
    Provider.of<AppModel>(context, listen: false).loadingToggle(false);
    Widget widget;
    switch (flag) {
      case "HOME":
        widget = isLogin ? const Home() : const Login();
        break;
      case "NEW COLLECTION NAME":
        widget = isLogin ? const NewCollectionName() : const Login();
        break;
      case "NEW PRODUCT UPLOAD":
        widget = isLogin ? const CreateProductUpload() : const Login();
        break;
      case "LOGOUT":
        preferences?.clear();
        widget = const Login();
        break;
      case "LOG IN":
        preferences?.clear();
        widget = const Login();
        break;
      case "READY STOCK":
        widget = isLogin ? const ReadyStock() : const Login();
        break;case "ORDER STOCK":
        widget = isLogin ? const OrderStock() : const Login();
        break;
      default:
        widget = const Home();
    }
    return widget;
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }
}
