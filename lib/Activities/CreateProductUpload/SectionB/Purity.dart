import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/MetalColor.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/Purity/PurityRequest.dart';
import 'package:jewelssky/Model/Purity/PurityResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class Purity extends StatefulWidget {
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

  Purity(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, {Key? key}) : super(key: key);

  @override
  _PurityState createState() => _PurityState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId);
}

class _PurityState extends State<Purity> {
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

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _PurityState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId);

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
                        "Purity",
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
                                MaterialPageRoute(builder: (context) => MetalColor(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId)),
                              ),
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(collectionTypeList[index].matCode!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      const SizedBox(width: 10,),
                                      Text(collectionTypeList[index].purity!),
                                    ],
                                  ),
                                  const SizedBox(height: 2,),
                                  Text("Purity ratio " + collectionTypeList[index].purityRatio.toString()),
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

    PurityRequest requestModel = PurityRequest(mIdPurity: ptype);

    apiService
        .getPurity(requestModel)
        .then((value) => {
              if (value.messageId == 1)
                {
                  setState(() {
                    isLoading=false;
                    collectionTypeList.addAll(value.data!);
                    isLoading = false;
                  })
                }
            })
        .onError((error, stackTrace) => {});
  }
}
