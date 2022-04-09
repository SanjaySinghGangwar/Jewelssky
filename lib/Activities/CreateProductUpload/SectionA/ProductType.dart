import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/SelectCollection.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/ProductType/ProductTypeRequest.dart';
import 'package:jewelssky/Model/ProductType/ProductTypeResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fullscreen/fullscreen.dart';

class productType extends StatefulWidget {
  String stockType = "";
  String HUID = "";

  productType(this.stockType, this.HUID, {Key? key}) : super(key: key);

  @override
  _productTypeState createState() => _productTypeState(stockType, HUID);
}

class _productTypeState extends State<productType> {
  String stockType = "";
  String huid = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> productTypeList = [];

  _productTypeState(this.stockType, this.huid);

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
        hitApi(preferences!.getString(mSharedPreference().userID)!);
      });
    });

    //
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
                        SizedBox(height: 30),
                        Text(
                          "PRODUCT TYPE",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                        ),
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: productTypeList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => {
                                print("YES" + productTypeList[index].proId.toString()),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SelectCollection(stockType, huid, productTypeList[index].proId.toString())),
                                ),
                              },
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                    child: Text(
                                      productTypeList[index].proEname!,
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
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
    ProductTypeRequest requestModel = ProductTypeRequest(user_id: userID);
    apiService
        .prodTypeMaster(requestModel)
        .then((value) => {
              if (value.messageId == 1)
                {
                  setState(() {
                    productTypeList.addAll(value.data!);
                    isLoading = false;
                  })
                }
            })
        .onError((error, stackTrace) => {});
  }
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return true;
  }
}
