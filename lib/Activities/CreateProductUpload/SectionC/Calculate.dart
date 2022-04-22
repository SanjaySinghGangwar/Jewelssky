import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/JobWiseMaterialDetails.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionD/UploadImage.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/AddSpecification/AddSpecificationRequest.dart';
import 'package:jewelssky/Model/SettingA/SettingResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fullscreen/fullscreen.dart';
import 'MaterialType.dart';

class Calculate extends StatefulWidget {
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
  String settingName = "";
  String settingID = "";
  String materialSize = "";
  String materialSizeID = "";
  String materialColorID = "";
  String materialColor = "";
  String shape = "";
  String quality = "";
  String qualityID = "";
  String materialName = "";
  String dgno;
  String geniid;

  Calculate(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.materialID, this.shapeId, this.settingID, this.settingName, this.materialSize, this.materialSizeID, this.materialColorID, this.materialColor, this.shape, this.quality, this.qualityID, this.materialName, this.dgno, this.geniid, {Key? key})
      : super(key: key);

  @override
  _CalculateState createState() => _CalculateState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId, settingID, settingName, materialSize, materialSizeID, materialColorID, materialColor, shape, quality, qualityID, materialName, dgno, geniid);
}

class _CalculateState extends State<Calculate> {
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
  String materialID = "";
  String shapeId = "";
  String settingName = "";
  String settingID = "";
  String materialSize = "";
  String materialSizeID = "";
  String materialColorID = "";
  String materialColor = "";
  String shape = "";
  String quality = "";
  String qualityID = "";
  String materialName = "";
  String dgno;
  String geniid;
  bool mFlag = true;
  String jobNumber = "";

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _CalculateState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.materialID, this.shapeId, this.settingID, this.settingName, this.materialSize, this.materialSizeID, this.materialColorID, this.materialColor, this.shape, this.quality, this.qualityID, this.materialName, this.dgno, this.geniid);

  TextEditingController Pcs = TextEditingController();
  TextEditingController CtwController = TextEditingController();
  TextEditingController RateController = TextEditingController();
  TextEditingController Pointer = TextEditingController();
  TextEditingController totalValue = TextEditingController();

  @override
  void initState() {
    super.initState();



    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
      });
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
            child: ListView(
              children: <Widget>[
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
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Material Specification",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    flex: 1,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: Pcs,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Pcs',
                        fillColor: mUtis.backgroundColorr,
                        hoverColor: mUtis.backgroundColorr,
                        focusColor: mUtis.backgroundColorr,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    flex: 1,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: CtwController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Ctw',
                        fillColor: mUtis.backgroundColorr,
                        hoverColor: mUtis.backgroundColorr,
                        focusColor: mUtis.backgroundColorr,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    flex: 1,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: RateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Rate',
                        fillColor: mUtis.backgroundColorr,
                        hoverColor: mUtis.backgroundColorr,
                        focusColor: mUtis.backgroundColorr,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    readOnly: true,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    controller: calculatePointer(Pcs.text.toString(), CtwController.text.toString()),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Pointer',
                      fillColor: mUtis.backgroundColorr,
                      hoverColor: mUtis.backgroundColorr,
                      focusColor: mUtis.backgroundColorr,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    readOnly: true,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    controller: getTotalValue(CtwController.text.toString(), RateController.text.toString()),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Total Value',
                      fillColor: mUtis.backgroundColorr,
                      hoverColor: mUtis.backgroundColorr,
                      focusColor: mUtis.backgroundColorr,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('ADD MORE'),
                          onPressed: () {
                            addDataToServer(1);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('VIEW ALL'),
                          onPressed: () {
                            addDataToServer(2);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('SAVE'),
                          onPressed: () {
                            addDataToServer(3);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addDataToServer(int flag) {
    setState(() {
      isLoading = true;
    });
    if (mFlag) {
      AddSpecificationRequest request = AddSpecificationRequest(
          userId: preferences!.getString(mSharedPreference().userID),
          id: ptype,
          materialId: materialID,
          materialType: materialName,
          shape: shape,
          shapeId: shapeId,
          quality: quality,
          qualityId: qualityID,
          materialcolor: materialColor,
          materialcolorId: materialColorID,
          matsize: materialSize,
          matsizeId: materialSizeID,
          sett: settingID,
          settNm: settingName,
          pcs: Pcs.text.toString(),
          ctw: CtwController.text.toString(),
          pointer: Pointer.text.toString(),
          rate: RateController.text.toString(),
          dgno: dgno,
          geniid: geniid);
      apiService.AddSpecification(request)
          .then((value) => {
                if (value.messageId == 1)
                  {
                    setState(() {
                      jobNumber=value.msg.toString();
                      isLoading = false;
                      if (flag == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MaterialTypeA(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, dgno, geniid)),
                        );
                      } else if (flag == 2) {
                        mFlag = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobWiseMaterialDesign(jobNumber)),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpLoadImage(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId, jobNumber)),
                        );
                      }
                    })
                  }
              })
          .onError((error, stackTrace) => {});
    } else {
      if (flag == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MaterialTypeA(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, dgno, geniid)),
        );
      } else if (flag == 2) {
        mFlag = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobWiseMaterialDesign(jobNumber)),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpLoadImage(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId, jobNumber)),
        );
      }
    }
  }

  getTotalValue(String ctwValue, String ratee) {
    if (ctwValue.isNotEmpty && ratee.isNotEmpty) {
      totalValue.text = (double.parse(ctwValue) * double.parse(ratee)).toString();
    } else {
      totalValue.text = "0";
    }
    return totalValue;
  }

  calculatePointer(
    String pcs,
    String ctw,
  ) {
    if (pcs.isNotEmpty && ctw.isNotEmpty) {
      Pointer.text = (double.parse(ctw) / double.parse(pcs)).toString();
    } else {
      Pointer.text = "0";
    }
    return Pointer;
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }
}
