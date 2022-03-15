import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionC/Size.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/Shape/ShapeResponse.dart';

import 'package:jewelssky/Model/Shape/ShapeRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shape extends StatefulWidget {
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


   Shape(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID,{Key? key}) : super(key: key);

  @override
  _ShapeState createState() => _ShapeState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID);
}

class _ShapeState extends State<Shape> {
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

  List<Data> collectionTypeList = [];

  SharedPreferences? preferences;

  _ShapeState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId,this.materialID);

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
                const Text(
                  "Shape",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: collectionTypeList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SizeA(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId,materialID,collectionTypeList[index].shapeId.toString())),
                        ),
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(collectionTypeList[index].shape.toString()),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
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
      //isLoading=true;
    });

    ShapeRequest request = ShapeRequest(matType: materialID);
    apiService.getShapeMaster(request)
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
