import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/ProductType.dart';
import 'package:jewelssky/Activities/LoginScreen.dart';
import 'package:jewelssky/Model/GetProdductRecord/GetProdductRecordReqest.dart';
import 'package:jewelssky/Model/StockType/StockType.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Common/Loader.dart';
import '../../../HttpService/APIService.dart';
import 'package:jewelssky/Model/GetProdductRecord/GetProdductRecordResponse.dart';

class CreateProductUpload extends StatefulWidget {
  var EditJobNumber;

  CreateProductUpload(this.EditJobNumber, {Key? key}) : super(key: key);

  @override
  _CreateProductUploadState createState() => _CreateProductUploadState(EditJobNumber);
}

class _CreateProductUploadState extends State<CreateProductUpload> {
  var islogin = false;
  var isLoading = true;
  List<StockType> list = [];
  SharedPreferences? preferences;
  TextEditingController HUID = TextEditingController();

  var editJobNumber;
  APIService apiService = APIService();
  var productEditData;

  _CreateProductUploadState(this.editJobNumber);

  @override
  void initState() {
    FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();
    addDataToList();
    initializePreference().whenComplete(() {
      setState(() {
        islogin = preferences!.getBool(mSharedPreference().isLogin)!;
      });
    });

    if (editJobNumber
        .toString()
        .isNotEmpty) {
      getProductsDetails(editJobNumber);
    } else {
      setState(() {
        isLoading=false;
      });
      print("YESS I AM A NOT AN EDIT SCREEN");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return WillPopScope(
        onWillPop: () async {
          // You can do some work here.
          // Returning true allows the pop to happen, returning false prevents it.
          return false;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoading
              ? Loader() : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Enter HUID (Optional)",
                      style: TextStyle(color: mUtis.backgroundColorr, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery
                          .of(context)
                          .viewInsets
                          .bottom),
                      child: TextField(
                        controller: HUID,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Enter HUID',
                          fillColor: mUtis.backgroundColorr,
                          hoverColor: mUtis.backgroundColorr,
                          focusColor: mUtis.backgroundColorr,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Stock Type",
                      style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _horizontalListView(list),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const Login();
    }
  }

  Widget _horizontalListView(List<StockType> mList) {
    return SizedBox(
      height: 100,
      width: 230,
      child: AnimatedList(
        scrollDirection: Axis.vertical,
        initialItemCount: mList.length,
        itemBuilder: (context, index, animation) =>
            InkWell(
              onTap: () =>
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => productType(list[index].value!, HUID.text,productEditData)),
                ),
              },
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      mList[index].name!,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
      ),
    );
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }

  void addDataToList() {
    list.add(StockType(name: "Ready Stock", value: "Actual"));
    list.add(StockType(name: "Order Stock", value: "Virtual"));
  }

  void getProductsDetails(editJobNumber) {
    setState(() {
      isLoading = true;
    });
    GetProdductRecordReqest requestModel = GetProdductRecordReqest(jobId: editJobNumber);
    apiService.getProductDataForEdit(requestModel).whenComplete(() => {

    });
    apiService.getProductDataForEdit(requestModel)
        .then((value) =>
    {
      if (value.messageId == 1)
        {
          setState(() {
            productEditData = value.data!;
            isLoading = false;
            print(productEditData);

           //var data= productEditData as Data;

          })
        }
    })
        .onError((error, stackTrace) => {

    });
  }
}
