import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/OrderStock/OrderStockRequest.dart';
import 'package:jewelssky/Model/OrderStock/OrderStockResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:provider/provider.dart';

class OrderStock extends StatefulWidget {
  const OrderStock({Key? key}) : super(key: key);

  @override
  _OrderStockState createState() => _OrderStockState();
}

class _OrderStockState extends State<OrderStock> {
  String stockType = "";
  String huid = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> productTypeList = [];

  _OrderStockState();

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
                        SizedBox(height: 0),
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: productTypeList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => {},
                              child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        colorFilter:
                                        ColorFilter.mode(Colors.black.withOpacity(0.5),
                                            BlendMode.dstATop),
                                        image: NetworkImage(productTypeList[index].source=="ERP"?"https://www.jewelsbucket.com/jobimage/" + productTypeList[index].imgpath!: "http://imgproc.kapishdigital.com/" + productTypeList[index].imgpath! ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "S.No. " + (index + 1).toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Job No : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].jobNo.toString()),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Date : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].entryDt!),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Design No : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].designno.toString()),
                                                    ],
                                                  )),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Material Purity : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].matel.toString() + " " + productTypeList[index].purity.toString()),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Product Type : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].proEname!),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Collection : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].collectionName!),
                                                    ],
                                                  )),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Category : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].categoryName.toString()),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Gwt : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].gwt.toString()),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Nwt : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].nwt!.toString()),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "Diawt : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].diwCtwWt!.toString()),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "CsWt : ",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(productTypeList[index].colorCtwWt!.toString()),
                                                    ],
                                                  )),
                                            ],
                                          ),

                                        ],
                                      ),
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
                              Provider.of<AppModel>(context, listen: false).updateTitle("HOME");
                              setState(() {

                              });
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
    OrderStockRequest requestModel = OrderStockRequest(ptype: "0", coll: "0", cat: "0", scat: "0", purity: "0", userId: preferences!.getString(mSharedPreference().userID)!);
    apiService.GetOrderStock(requestModel)
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
