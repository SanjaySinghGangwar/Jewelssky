import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/getVendorUserCollection/getVendorUserCollectionResponse.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fullscreen/fullscreen.dart';
class NewCollectionName extends StatefulWidget {
  const NewCollectionName({Key? key}) : super(key: key);

  @override
  _NewCollectionNameState createState() => _NewCollectionNameState();
}

class _NewCollectionNameState extends State<NewCollectionName> {
  var isLoading = true;
  var islogin = false;
  APIService apiService = APIService();

  List<getVendorUserCollectionResponse> collectionTypeList = [];

  SharedPreferences? preferences;

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();

    initializePreference().whenComplete(() {
      hitApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoading
          ? Loader()
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                child: const Icon(Icons.add_outlined),
              ),
              body: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "M/W Collection Type Master",
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
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          collectionTypeList[index].collType.toString(),
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          collectionTypeList[index].createdDate.toString(),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Row(
                          children: [
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
    this.preferences = await SharedPreferences.getInstance();
  }

  void hitApi() {
    setState(() {
      isLoading = true;
    });

    apiService
        .getVendorUserCollection(preferences!.getString(mSharedPreference().userID).toString())
        .then((value) => {
              setState(() {
                //collectionTypeList.addAll();
                print("valueeee :: "+value.toString());
                isLoading = false;
              })
            })
        .onError((error, stackTrace) => {});
  }
}
