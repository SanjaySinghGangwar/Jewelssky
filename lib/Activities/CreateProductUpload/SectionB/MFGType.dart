import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/MaterialType.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/MFGType/MFGTypeResponse.dart';
import 'package:jewelssky/Model/SaveMetalSetSecond/SaveMetalSetSecondRequest.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fullscreen/fullscreen.dart';

class MFGType extends StatefulWidget {
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
  String dgno;
  String geniid;
  String GrossWeight;
  String NetWeight;
  String WasteWeight;
  String purityID;
  String purity;
  String purityDT;
  String labCerti;
  String matcol;
  String mtid;
  String Mat_Code;

  MFGType(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.dgno, this.geniid,this.GrossWeight,this.NetWeight,this.WasteWeight,this.purityID,this.purityDT,this.purity,this.labCerti,this.matcol,this.mtid,this.Mat_Code ,{Key? key}) : super(key: key);

  @override
  _MFGTypeState createState() =>
      _MFGTypeState(
          stockType,
          HUID,
          ptype,
          collection,
          col,
          cat,
          mwCollection,
          scat,
          cultNm,
          cultId,
          dgno,
          geniid,GrossWeight,NetWeight,WasteWeight,purityID,purityDT,purity,labCerti,matcol,mtid,Mat_Code);
}

class _MFGTypeState extends State<MFGType> {
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
  String dgno;
  String geniid;
  String GrossWeight;
  String NetWeight;
  String WasteWeight;
  String purityID;
  String purity;
  String purityDT;
  String labCerti;
  String matcol;
  String mtid;
  String Mat_Code;

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _MFGTypeState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.dgno, this.geniid,this.GrossWeight,this.NetWeight,this.WasteWeight,this.purityID,this.purityDT,this.purity,this.labCerti,this.matcol,this.mtid,this.Mat_Code);

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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
                      "MFG Type",
                      style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                    ),
                    Expanded(
                      flex: 8,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: collectionTypeList.length,
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: () => {saveSecondStep(index)},
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          collectionTypeList[index].mkTypeName.toString(),
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(mUtis.backgroundColorr),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('BACK'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              textColor: Colors.white,
                              color: mUtis.backgroundColorr,
                              child: const Text('SKIP'),
                              onPressed: () {
                                saveSecondStep(null);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
      isLoading = true;
    });

    apiService
        .getMFGType()
        .then((value) =>
    {
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

  saveSecondStep(int? index) {
    setState(() {
      isLoading = true;
    });
    SaveMetalSetSecondRequest  requestModel = SaveMetalSetSecondRequest(userId: preferences?.getString(mSharedPreference().userID),id: "0",puritydt: purityDT/*purity*/,purity: purity/*purityRatio*/,matcol: matcol/*mcolid*/,mntwastage: WasteWeight,gwt: GrossWeight,nwt: NetWeight,dgno: dgno,geniid: geniid,makamt: "0",mattypes: mtid/*mtid Get_Metal_Wise_Purity*/,mattypesNm: Mat_Code/*Mat_Code Get_Metal_Wise_Purity*/,orderid: "0",oldJobNo: "0",labCerti: labCerti,makeType: index!=null?collectionTypeList[index].mkType.toString():"",);
    apiService
        .SaveMetalSetSecond(requestModel)
        .then((value) =>
    {
      if (value.messageId == 1)
        {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  MaterialTypeA(
                      stockType,
                      HUID,
                      ptype,
                      collection,
                      col,
                      cat,
                      mwCollection,
                      scat,
                      cultNm,
                      cultId,
                      dgno,
                      geniid)),
            );
          })
        }
    })
        .onError((error, stackTrace) => {});
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          MaterialTypeA(
              stockType,
              HUID,
              ptype,
              collection,
              col,
              cat,
              mwCollection,
              scat,
              cultNm,
              cultId,
              dgno,
              geniid)),
    );*/
  }
}
