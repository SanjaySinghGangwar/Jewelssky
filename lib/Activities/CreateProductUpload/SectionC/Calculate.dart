import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/JobWiseMaterialDetails.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionD/UploadImage.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/AddSpecification/AddSpecificationRequest.dart';
import 'package:jewelssky/Model/SettingA/SettingResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Calculate(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.materialID, this.shapeId, {Key? key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId);
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

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _CalculateState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.materialID, this.shapeId);

  TextEditingController Pcs = TextEditingController();
  TextEditingController CtwController = TextEditingController();
  TextEditingController RateController = TextEditingController();
  TextEditingController Pointer = TextEditingController();
  TextEditingController totalValue = TextEditingController();

  @override
  void initState() {
    super.initState();
    Pcs.text = "0";
    CtwController.text = "0";
    RateController.text = "0";
    Pointer.text = "0";
    totalValue.text = "0";

    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  child: TextField(
                    controller: Pcs,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Pcs',
                      fillColor: mUtis.backgroundColorr,
                      hoverColor: mUtis.backgroundColorr,
                      focusColor: mUtis.backgroundColorr,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
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
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
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
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('ADD MORE'),
                          onPressed: () {
                            addDataToServer(false);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('VIEW ALL'),
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => JobWiseMaterialDesign("")),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('SAVE'),
                          onPressed: () {
                            addDataToServer(true);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
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

  void addDataToServer(bool flag) {
   /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpLoadImage(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId)),
    );*/


    setState(() {

      isLoading = true;
    });
    AddSpecificationRequest request = AddSpecificationRequest(userId: preferences!.getString(mSharedPreference().userID), id: "", materialId: materialID, materialType: "", shape: "", shapeId: shapeId, quality: "", qualityId: "", materialcolor: "", materialcolorId: materialID, matsize: "", matsizeId: "", sett: "", settNm: "", pcs: Pcs.text.toString(), ctw: CtwController.text.toString(), pointer: Pointer.text.toString(), rate: RateController.text.toString(), dgno: "", geniid: "");
    apiService.AddSpecification(request)
        .then((value) => {
              if (value.messageId == 1)
                {
                  setState(() {
                    isLoading = false;
                    if (flag) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpLoadImage(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId)),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MaterialTypeA(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId)),
                      );
                    }
                  })
                }
            })
        .onError((error, stackTrace) => {});
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
