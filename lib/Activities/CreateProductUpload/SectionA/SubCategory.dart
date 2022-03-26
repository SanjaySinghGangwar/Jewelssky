import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/MWCollection.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/SubCategory/SubCategoryRequest.dart';
import 'package:jewelssky/Model/SubCategory/SubCategoryResponse.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategory extends StatefulWidget {
  String col = "";
  String cat = "";
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";

  SubCategory(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, {Key? key}) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState(stockType, HUID, ptype, collection, col, cat);
}

class _SubCategoryState extends State<SubCategory> {
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";
  String col = "";
  String cat = "";
  String flag = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> collectionTypeList = [];

  _SubCategoryState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat);

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
        hitApi();
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
                      SizedBox(
                        height: 30,
                      ),
                       Text(
                        "Sub Category",
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
                                MaterialPageRoute(builder: (context) => MWCollection(stockType, HUID, ptype, collection, col, cat, collectionTypeList[index].sCatId.toString())),
                              ),
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                              child: Text(collectionTypeList[index].subCatName!),
                            )),
                          ),
                        ),
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

  void hitApi() {
    setState(() {
      isLoading = true;
    });

    SubCategoryRequest requestModel = SubCategoryRequest(col: col, cat: cat);
    apiService
        .getSubCategory(requestModel)
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
