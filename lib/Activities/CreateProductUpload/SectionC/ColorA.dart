import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/SettingA.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/ColorA/ColorARequest.dart';
import 'package:jewelssky/Model/Quality/QualityRequest.dart';
import 'package:jewelssky/Model/ColorA/ColorAResponse.dart';

import 'package:jewelssky/Model/Shape/ShapeRequest.dart';
import 'package:jewelssky/Model/SizeA/SizeARequest.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:fullscreen/fullscreen.dart';
class ColorA extends StatefulWidget {
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
  String materialSize = "";
  String materialSizeID = "";
  String shape = "";
  String quality = "";
  String qualityID = "";
  String materialName = "";
  String dgno;String geniid;

  ColorA(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,this.shapeId,this.materialSize,this.materialSizeID,this.shape,this.quality,this.qualityID,this.materialName,this.dgno,this.geniid,{Key? key}) : super(key: key);

  @override
  _ColorAState createState() => _ColorAState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID,shapeId,materialSize,materialSizeID,shape,quality,qualityID,materialName,dgno,geniid);
}

class _ColorAState extends State<ColorA> {
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
  String materialSize = "";
  String materialSizeID = "";
  String shape = "";
  String quality = "";
  String qualityID = "";
  String materialName = "";
  String dgno;String geniid;

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _ColorAState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,this.shapeId,this.materialSize,this.materialSizeID,this.shape,this.quality,this.qualityID,this.materialName,this.dgno,this.geniid);

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();
    print("YES" + ptype);
    initializePreference().whenComplete(() {
      hitApi(ptype);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // You can do some work here.
        // Returning true allows the pop to happen, returning false prevents it.
        return false;
      },
      child: MaterialApp(
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
                  preferences != null
                      ? Text(
                    "Design : " + preferences!.getString(mSharedPreference().design).toString() + "  Job : " + preferences!.getString(mSharedPreference().jobNumber).toString(),
                    textAlign: TextAlign.center,
                  )
                      : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    "Color",
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
                            MaterialPageRoute(builder: (context) => SettingA(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID,shapeId,materialSize,materialSizeID,collectionTypeList[index].matColId.toString(),collectionTypeList[index].color.toString(),shape,quality,qualityID,materialName,dgno,geniid)),
                          ),
                        },
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(collectionTypeList[index].color.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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

    ColorARequest request = ColorARequest(matType: materialID);
    apiService.getColor(request)
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
