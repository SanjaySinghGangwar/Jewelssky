import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/Category.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionRequest.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCollection extends StatefulWidget {
  String ptype = "";
  String stockType = "";
  String HUID = "";


  SelectCollection(String stockType,String HUID,String ptype, {Key? key}) : super(key: key) {
    this.ptype = ptype;
    this.stockType=stockType;
    this.HUID=HUID;
  }

  @override
  _SelectCollectionState createState() => _SelectCollectionState(ptype,HUID,stockType);
}

class _SelectCollectionState extends State<SelectCollection> {
  String ptype = "";
  String HUID = "";
  String flag = "";
  String stockType = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> collectionTypeList = [];

  _SelectCollectionState(this.ptype, this.HUID, this.stockType);

  @override
  void initState() {
    super.initState();
    print("YES" + ptype);
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
                const SizedBox(height: 20,),
                const Text(
                  "Select Collection",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: collectionTypeList.length,
                    itemBuilder: (context, index) =>
                        InkWell(
                          onTap: () =>
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Category(stockType,HUID,ptype,collectionTypeList[index].colId.toString())),
                            ),
                          },
                          child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                child: Text(collectionTypeList[index].collectionName!),
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

  void hitApi() {
    setState(() {
      isLoading = true;
    });

    SelectCollectionRequest requestModel = SelectCollectionRequest(ptype: ptype);
    apiService.GetCollection(requestModel)
        .then((value) =>
    {
      if (value.messageId == 1)
        {
          setState(() {
            print("yess");
            collectionTypeList.addAll(value.data!);
            isLoading = false;
            print(collectionTypeList.length);
          })
        }
    })
        .onError((error, stackTrace) => {});
  }
}
