import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/jobWiseMaterialDetails/jobWiseMaterialDetailsRequest.dart';
import 'package:jewelssky/Model/jobWiseMaterialDetails/jobWiseMaterialDetailsResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fullscreen/fullscreen.dart';
class JobWiseMaterialDesign extends StatefulWidget {
  String jobNumber = "";

  JobWiseMaterialDesign(this.jobNumber, {Key? key}) : super(key: key);

  @override
  _JobWiseMaterialDesignState createState() => _JobWiseMaterialDesignState(jobNumber);
}

class _JobWiseMaterialDesignState extends State<JobWiseMaterialDesign> {
  String jobNumber = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> collectionTypeList = [];

  _JobWiseMaterialDesignState(this.jobNumber);

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
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
                          height: 30,
                        ),
                        Text(
                          "Job Wise Material Design",
                          style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                        ),
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: collectionTypeList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => {},
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Text("S.No. "+(index+1).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    SizedBox(height: 15,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Material Type : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].materialType!),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Shape : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].shape!),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Size : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].size!),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Quality : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].quality!),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Color : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].color!),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Setting : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].setting!),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Pcs : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].pcs!.toString()),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Ctw : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].ctw!.toString()),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Rate : ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(collectionTypeList[index].diamondRate!.toString()),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Pointer : ",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(collectionTypeList[index].pointer!.toString()),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Amount  : ",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(collectionTypeList[index].diamondAmt!.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
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

    jobWiseMaterialDetailsRequest requestModel = jobWiseMaterialDetailsRequest(jobNo: jobNumber);

    apiService
        .jobWiseMaterialDetails(requestModel)
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
