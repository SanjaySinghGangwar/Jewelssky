import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/MFGType.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/LabCertification/LabCertificationResponse.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LabCertified extends StatefulWidget {
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

   LabCertified(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.dgno,this.geniid,{Key? key}) : super(key: key);

  @override
  _LabCertifiedState createState() => _LabCertifiedState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,dgno,geniid);
}

class _LabCertifiedState extends State<LabCertified> {
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

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _LabCertifiedState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.dgno,this.geniid);

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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    "Lab Certified",
                    style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                  ),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: collectionTypeList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MFGType(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,dgno,geniid)),
                          ),
                        },
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(collectionTypeList[index].certiName.toString()),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: mUtis.backgroundColorr,
                        child: const Text('SKIP'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MFGType(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,dgno,geniid)),
                          );
                        },
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
        .getLabCertification()
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
