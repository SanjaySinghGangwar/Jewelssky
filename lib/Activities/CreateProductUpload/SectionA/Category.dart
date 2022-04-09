import 'package:flutter/material.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/SubCategory.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/Category/CategortRequest.dart';
import 'package:jewelssky/Model/Category/CategoryResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:fullscreen/fullscreen.dart';

class Category extends StatefulWidget {
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";

  Category(this.stockType, this.HUID, this.ptype, this.collection, {Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState(stockType, HUID, ptype, collection);
}

class _CategoryState extends State<Category> {
  String collection = "";
  String HUID = "";
  String ptype = "";
  String stockType = "";
  String flag = "";
  var isLoading = true;

  APIService apiService = APIService();
  SharedPreferences? preferences;
  List<Data> categoryList = [];

  _CategoryState(this.stockType, this.HUID, this.ptype, this.collection);

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
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
                          "Select Category",
                          style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                        ),
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SubCategory(stockType, HUID, ptype, collection,categoryList[index].colId.toString(), categoryList[index].catId.toString())),
                                ),
                              },
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                                child: Text(categoryList[index].categoryName!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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

    CategortRequest requestModel = CategortRequest(col: collection);
    apiService
        .getCategory(requestModel)
        .then((value) => {
              if (value.messageId == 1)
                {
                  setState(() {
                    categoryList.addAll(value.data!);
                    isLoading = false;
                  })
                }
            })
        .onError((error, stackTrace) => {});
  }
}
