import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/LabCertified.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/SettingA/SettingResponse.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController Ctw = TextEditingController();
  TextEditingController Rate = TextEditingController();
  TextEditingController Pointer = TextEditingController();

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
                    controller: Ctw,
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
                    controller: Rate,
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
                    keyboardType: TextInputType.number,
                    controller: Pointer,
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
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: mUtis.backgroundColorr,
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LabCertified(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
