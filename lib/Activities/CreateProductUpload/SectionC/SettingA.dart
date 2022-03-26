import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/Calculate.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/ColorA/ColorARequest.dart';
import 'package:jewelssky/Model/Quality/QualityRequest.dart';
import 'package:jewelssky/Model/SettingA/SettingResponse.dart';

import 'package:jewelssky/Model/Shape/ShapeRequest.dart';
import 'package:jewelssky/Model/SizeA/SizeARequest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';


class SettingA extends StatefulWidget {
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
  String materialID = "";
  String shapeId = "";

   SettingA(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,this.shapeId,{Key? key}) : super(key: key);

  @override
  _SettingAState createState() => _SettingAState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID,shapeId);
}

class _SettingAState extends State<SettingA> {
  var isLoading = true;
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
  String materialID = "";
  String shapeId = "";

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _SettingAState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,this.shapeId);

  @override
  void initState() {
    super.initState();
    print("YES" + ptype);
    initializePreference().whenComplete(() {
      hitApi(ptype);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoading
          ? Loader()
          : Scaffold(
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
                  height: 20,
                ),
                Text(
                  "Setting",
                  style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                ),
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: collectionTypeList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Calculate(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId)),
                        ),
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(collectionTypeList[index].settingName.toString()),
                              ],
                            ),
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
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  void hitApi(String ptype) {
    setState(() {
      isLoading=true;
    });

apiService.getSetting().whenComplete(() => {print("YESSSSSSS")});
    apiService.getSetting()
        .then((value) => {
      if (value.messageId == 1)
        {
          setState(() {
            collectionTypeList.addAll(value.data!);
            isLoading = false;
          })
        }
    })
        .onError((error, stackTrace) => {});
  }
}
