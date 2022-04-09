import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/Weights.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/MetalColor/MetalColorRequest.dart';
import 'package:jewelssky/Model/MetalColor/MetalColorResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:fullscreen/fullscreen.dart';

class MetalColor extends StatefulWidget {
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
  String dgno;String geniid;
  String purityID;
  String purity;
  String purityDT;
  String mtid;
  String Mat_Code;


  MetalColor(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.dgno,this.geniid,this.purityID,this.purityDT,this.purity,this.mtid,this.Mat_Code ,{Key? key}) : super(key: key);

  @override
  _MetalColorState createState() => _MetalColorState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,dgno,geniid,purityID,purityDT,purity,mtid,Mat_Code);
}

class _MetalColorState extends State<MetalColor> {
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
  String dgno;String geniid;
  String purityID;
  String purity;
  String purityDT;
  String mtid;
  String Mat_Code;


  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _MetalColorState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.dgno,this.geniid,this.purityID,this.purityDT,this.purity,this.mtid,this.Mat_Code);

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
                        Text("Design : " + preferences!.getString(mSharedPreference().design).toString() + "  Job : " + preferences!.getString(mSharedPreference().jobNumber).toString(),textAlign: TextAlign.start,),
                        const SizedBox(
                          height: 20,
                        ),
                         Text(
                          "Metal Color",
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
                                  MaterialPageRoute(builder: (context) => Weights(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,dgno,geniid,purityID,purityDT,purity,collectionTypeList[index].mcolid.toString(),mtid,Mat_Code)),
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

    apiService
        .getMetalColor()
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
