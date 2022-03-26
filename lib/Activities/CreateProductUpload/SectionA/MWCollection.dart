import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/RequiredOrderTime.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionRequest.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class MWCollection extends StatefulWidget {
  String col = "";
  String cat = "";
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";
  String scat = "";

  MWCollection(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat,this.scat, {Key? key}) : super(key: key);

  @override
  _MWCollectionState createState() => _MWCollectionState(stockType, HUID, ptype, collection, col, cat,scat);
}

class _MWCollectionState extends State<MWCollection> {
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";
  String col = "";
  String cat = "";
  String scat = "";
  String flag = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> collectionTypeList = [];

  _MWCollectionState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat,this.scat);

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
        hitApi(preferences!.getString(mSharedPreference().userID)!);
      });
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
                        height: 30,
                      ),
                       Text(
                        "M/W Collection",
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
                                MaterialPageRoute(builder: (context) => RequiredOrderTime(stockType, HUID, ptype, collection, col, cat,collectionTypeList[index].collType!,scat,collectionTypeList[index].collType!,collectionTypeList[index].id!.toString())),
                              ),
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                              child: Text(collectionTypeList[index].collType!),
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

  void hitApi(String userID) {
    setState(() {
      isLoading = true;
    });

    MWCollectionRequest requestModel = MWCollectionRequest(user_id: userID);
    apiService.mWCollection(requestModel)
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
