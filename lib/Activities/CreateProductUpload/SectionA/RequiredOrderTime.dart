import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionRequest.dart';
import 'package:jewelssky/Model/SaveDesignSetFirst/SaveDesignSetFirstRequest.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequiredOrderTime extends StatefulWidget {
  String col = "";
  String cat = "";
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";
  String mwCollection = "";

  RequiredOrderTime(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, {Key? key}) : super(key: key);

  @override
  _RequiredOrderTimeState createState() => _RequiredOrderTimeState(stockType, HUID, ptype, collection, col, cat, mwCollection);
}

class _RequiredOrderTimeState extends State<RequiredOrderTime> {
  var isLoading = false;
  var islogin = false;
  APIService apiService = APIService();
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";
  String col = "";
  String cat = "";
  String mwCollection = "";

  List<String> list = ["1 Week", "2 Week", "3 Week", "4 Week"];

  SharedPreferences? preferences;

  _RequiredOrderTimeState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection);

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
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Required Order Time",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => {},
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                          child: Text(list[index]),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
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
            /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => productType(mList[index])),
            ),*/
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
    preferences = await SharedPreferences.getInstance();
  }
  void hitApi(String userID) {
    setState(() {
      isLoading = true;
    });

    SaveDesignSetFirstRequest requestModel = SaveDesignSetFirstRequest(userId: preferences!.getString(mSharedPreference().userID)!,ptype: ptype,coll: col,cat: cat,scat: "",cultId: "",cultNm: "",occi: "",occiNm: "",stype: "",exday: "",orderTime: "",huid: HUID );
    apiService.saveDesignSetFirst(requestModel)
        .then((value) => {
      if (value.messageId == 1)
        {
          setState(() {

            isLoading = false;
          })
        }
    })
        .onError((error, stackTrace) => {});
  }

}

