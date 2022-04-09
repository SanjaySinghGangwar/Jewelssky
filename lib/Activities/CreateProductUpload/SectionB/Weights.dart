import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/LabCertified.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Weights extends StatefulWidget {
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
  String purityID;
  String purity;
  String purityDT;
  String matcol;
  String mtid;
  String Mat_Code;

  Weights(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.dgno, this.geniid, this.purityID, this.purityDT, this.purity, this.matcol, this.mtid, this.Mat_Code, {Key? key}) : super(key: key);

  @override
  _WeightsState createState() =>
      _WeightsState(
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
          geniid,
          purityID,
          purityDT,
          purity,
          matcol,
          mtid,
          Mat_Code);
}

class _WeightsState extends State<Weights> {
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
  String dgno;
  String geniid;
  String purityID;
  String purity;
  String purityDT;
  String matcol;
  String mtid;
  String Mat_Code;


  SharedPreferences? preferences;

  _WeightsState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.dgno, this.geniid, this.purityID, this.purityDT, this.purity, this.matcol, this.mtid, this.Mat_Code);

  TextEditingController GrossWeight = TextEditingController();
  TextEditingController NetWeight = TextEditingController();
  TextEditingController Wastage = TextEditingController();
  TextEditingController WastageAmt = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
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
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Weights",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: GrossWeight,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Gross Weight (In Grm.)',
                        fillColor: mUtis.backgroundColorr,
                        hoverColor: mUtis.backgroundColorr,
                        focusColor: mUtis.backgroundColorr,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: GrossWeight,
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Net Weight (In Grm.)',
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
                      controller: Wastage,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Wastage',
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
                      controller: Wastage,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Wastage Amt.',
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
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('Next'),
                          onPressed: () {
                            if (GrossWeight.text
                                .toString()
                                .isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)
                              =>
                                  LabCertified(
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
                                      geniid,
                                      GrossWeight.text.toString(),
                                      GrossWeight.text.toString(),
                                      Wastage.text.toString(),
                                      purityID,
                                      purityDT,
                                      purity,
                                      matcol,
                                      mtid,
                                      Mat_Code)
                            ,
                            ));
                            } else {
                            mUtis.mToast("Enter Gross Weight");
                            }
                          },
                        ),
                      ),
                    ],
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
}
