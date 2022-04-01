import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewelssky/Activities/CreateProductUpload/SectionA/createProductUpload.dart';
import 'package:jewelssky/Activities/Home.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpLoadImage extends StatefulWidget {
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
  String shapeId = "";
  String jobNo = "";

  UpLoadImage(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.materialID, this.shapeId, this.jobNo, {Key? key}) : super(key: key);

  @override
  _UpLoadImageState createState() => _UpLoadImageState(stockType, HUID, ptype, collection, col, cat, mwCollection, scat, cultNm, cultId, materialID, shapeId, jobNo);
}

class _UpLoadImageState extends State<UpLoadImage> {
  File? imagee;
  File? imageFile;
  ImagePicker picker = ImagePicker();
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
  String shapeId = "";
  String jobNo = "";
  SharedPreferences? preferences;

  _UpLoadImageState(this.stockType, this.HUID, this.ptype, this.collection, this.col, this.cat, this.mwCollection, this.scat, this.cultNm, this.cultId, this.materialID, this.shapeId, this.jobNo);

  Future getImage() async {
    final image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      imagee = image as File?;
    });
  }

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Upload Image",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                  ),
                ),
                imagee != null
                    ? Image.file(
                        imagee!,
                        fit: BoxFit.contain,
                      )
                    : GestureDetector(
                        onTap: () {
                          _getFromGallery();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Image(
                            image: AssetImage('assets/image.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        color: mUtis.backgroundColorr,
                        onPressed: () {
                          apiService.uploadImage(jobNo, preferences!.getString(mSharedPreference().userID).toString(), imagee!.uri).then((value) => {
                                if (value.contains("Success"))
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Home(),
                                        ))
                                  }
                                else
                                  {mUtis.mToast('Enter User ID')}
                              });
                        },
                        child: Text(
                          "Upload & Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    /*SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: mUtis.backgroundColorr,
                        onPressed: () {},
                        child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imagee = File(pickedFile.path);
        imageFile = File(pickedFile.path);
        print("image ");
        print(imageFile);
      });
    }
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }
}
