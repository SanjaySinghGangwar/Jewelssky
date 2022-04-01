import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/Purity.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/RequiredOrderTime/RequiredOrderTime.dart';
import 'package:jewelssky/Model/SaveDesignSetFirst/SaveDesignSetFirstRequest.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';

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
                   Text(
                    "Required Order Time",
                    style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => {hitApi(list[index].value!)},
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                          child: Text(list[index].name!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>( mUtis.backgroundColorr),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('BACK'),
                    ),
                  )
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Purity(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,value.job.toString(),value.design.toString())),
                    );
                    //isLoading = false;
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
