import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/ProductType.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProductUpload extends StatefulWidget {
  const CreateProductUpload({Key? key}) : super(key: key);

  @override
  _CreateProductUploadState createState() => _CreateProductUploadState();
}

class _CreateProductUploadState extends State<CreateProductUpload> {
  var islogin = false;

  List<String> list = ["Ready Stock", "Order Stock"];

  SharedPreferences? preferences;
  TextEditingController HUID = TextEditingController();

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
    if (islogin) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Stock Type",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _horizontalListView(list),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter HUID (Optional)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextField(
                      controller: HUID,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Enter HUID',
                        fillColor: mUtis.backgroundColorr,
                        hoverColor: mUtis.backgroundColorr,
                        focusColor: mUtis.backgroundColorr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ); /*MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: mUtis.backgroundColorr,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Stock Type",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    child: InkWell(
                      onTap: () {

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => productType("UES")));
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: const [
                              Text("Ready Stock"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => productType("Order Stock")),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: const [
                              Text("Order Stock"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enter HUID (Optional)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextField(
                      controller: HUID,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Enter HUID',
                        fillColor: mUtis.backgroundColorr,
                        hoverColor: mUtis.backgroundColorr,
                        focusColor: mUtis.backgroundColorr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );*/
    } else {
      return const Login();
    }
  }

  Widget _horizontalListView(List<String> mList) {
    return SizedBox(
      height: 100,
      width: 230,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => productType(mList[index],HUID.text)),
            ),
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(mList[index]),
          )),
        ),
      ),
    );
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }
}
