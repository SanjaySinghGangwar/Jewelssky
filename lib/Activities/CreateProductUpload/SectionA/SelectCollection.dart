

import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/Category.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionRequest.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:fullscreen/fullscreen.dart';
class SelectCollection extends StatefulWidget {
  String ptype = "";
  String stockType = "";
  String HUID = "";

  SelectCollection(this.stockType, this.HUID, this.ptype, {Key? key}) : super(key: key);

  @override
  _SelectCollectionState createState() => _SelectCollectionState(ptype, HUID, stockType);
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
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
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
    return WillPopScope(
      onWillPop: () async {
        // You can do some work here.
        // Returning true allows the pop to happen, returning false prevents it.
        return false;
      },
      child: MaterialApp(
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
                          "Select Collection",
                          style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                        ),
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: collectionTypeList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => Category(stockType, HUID, ptype, collectionTypeList[index].colId.toString())),
                                ),
                              },
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                child: Text(collectionTypeList[index].collectionName!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
        .then((value) => {
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
  Future<bool> _onWillPop() async {
    //Navigator.pop(context);
    return false;
  }

}
