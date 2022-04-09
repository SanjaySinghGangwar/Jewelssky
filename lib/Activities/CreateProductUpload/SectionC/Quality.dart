import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/ColorA.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/Quality/QualityRequest.dart';
import 'package:jewelssky/Model/Quality/QualityResponse.dart';

import 'package:jewelssky/Model/Shape/ShapeRequest.dart';
import 'package:jewelssky/Model/SizeA/SizeARequest.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class Quality extends StatefulWidget {
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
  String materialName = "";
  String dgno;String geniid;

   Quality(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,this.shapeId,this.materialSize,this.materialSizeID,this.shape,this.materialName,this.dgno,this.geniid,{Key? key}) : super(key: key);

  @override
  _QualityState createState() => _QualityState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID,shapeId,materialSize,materialSizeID,shape,materialName,dgno,geniid);
}

class _QualityState extends State<Quality> {
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
  String materialName = "";
  String dgno;String geniid;

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _QualityState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,this.shapeId,this.materialSize,this.materialSizeID,this.shape,this.materialName,this.dgno,this.geniid);

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
                    "Quality",
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
                            MaterialPageRoute(builder: (context) => ColorA(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID,shapeId,materialSize,materialSizeID,shape,collectionTypeList[index].quality.toString(),collectionTypeList[index].matQtId.toString(),materialName,dgno,geniid)),
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
                                  Text(collectionTypeList[index].quality.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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

    QualityRequest request = QualityRequest(matType: materialID);
    apiService.getQuality(request)
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
