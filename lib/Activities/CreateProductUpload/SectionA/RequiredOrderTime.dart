import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/RequiredOrderTime/RequiredOrderTime.dart';
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
  String scat = "";
  String mwCollection = "";
  String cultNm = "";
  String cultId = "";

  RequiredOrderTime(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, {Key? key}) : super(key: key);

  @override
  _RequiredOrderTimeState createState() => _RequiredOrderTimeState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId);
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
  String scat = "";
  String cultNm = "";
  String cultId = "";

  List<RequiredOrderTimeModel> list = [];

  SharedPreferences? preferences;

  _RequiredOrderTimeState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId);

  @override
  void initState() {
    super.initState();
    addDataToList();
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
                        onTap: () => {hitApi(list[index].value!)},
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                          child: Text(list[index].name!),
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

  void hitApi(String orderTime) {
    setState(() {
      isLoading = true;
    });

    SaveDesignSetFirstRequest requestModel = SaveDesignSetFirstRequest(userId: preferences!.getString(mSharedPreference().userID)!, ptype: ptype, coll: col, cat: cat, scat: scat, cultId: cultId, cultNm: cultNm, occi: "0", occiNm: "0", stype: stockType, exday: orderTime, orderTime: "", huid: HUID);
    apiService
        .saveDesignSetFirst(requestModel)
        .then((value) => {
              if (value.messageId == 1)
                {
                  setState(() {
                    preferences!.setString(mSharedPreference().design, value.design!);
                    isLoading = false;
                  })
                }
            })
        .onError((error, stackTrace) => {});
  }

  void addDataToList() {
    list.add(RequiredOrderTimeModel(name: "1 Week", value: "7"));
    list.add(RequiredOrderTimeModel(name: "2 Week", value: "14"));
    list.add(RequiredOrderTimeModel(name: "3 Week", value: "21"));
    list.add(RequiredOrderTimeModel(name: "4 Week", value: "28"));
  }
}
