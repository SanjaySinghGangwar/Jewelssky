import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:provider/provider.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WebHome.dart';

class CustomMenuDashBoard extends StatefulWidget {
  @override
  _CustomMenuDashBoardState createState() => _CustomMenuDashBoardState();
}

class _CustomMenuDashBoardState extends State<CustomMenuDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: Menu(
        onClickCallBack: (title) {
          Provider.of<AppModel>(context, listen: false).updateTitle(title);
          Provider.of<AppModel>(context, listen: false);
        },
      ),
      screenSelectedBuilder: (position, controller) {
        return WebHome();
      },
    );
  }
}

class Menu extends StatefulWidget {
  final Function(String) onClickCallBack;

  const Menu({Key? key, required this.onClickCallBack}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  var islogin = false;
  SharedPreferences? preferences;

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        print("flag");
        print(mSharedPreference().isLogin!=null);
        islogin = preferences!.getBool(mSharedPreference().isLogin)!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "assets/background.webp",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
              child: Container(
            color: Colors.white70,
          )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  menuItem("HOME", Icons.home, context, widget),
                  menuItem("NEW PRODUCT UPLOAD", Icons.ac_unit_rounded, context, widget),
                  menuItem("READY STOCK", Icons.timeline_rounded, context, widget),
                  menuItem("ORDER STOCK", Icons.stream, context, widget),
                  islogin ? menuItem("LOGOUT", Icons.person, context, widget) : menuItem("LOG IN", Icons.person, context, widget),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }
}

Widget menuItem(String title, IconData icon, context, widget) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        widget.onClickCallBack(title);
        SimpleHiddenDrawerController.of(context).toggle();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: mUtis().black,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title,
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: mUtis().black,
                    fontSize: 18)),
          ],
        ),
      ),
    ),
  );
}
