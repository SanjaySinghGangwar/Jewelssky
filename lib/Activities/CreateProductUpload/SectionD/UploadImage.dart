import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:provider/provider.dart';
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

enum AppState {
  free,
  picked,
  cropped,
}

class _UpLoadImageState extends State<UpLoadImage> {
  late AppState state;

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
    imageFile = image as File?;
    _cropImage();
    setState(() {});
  }

  @override
  void initState() {
    state = AppState.free;
    FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: isLoading
          ? Loader()
          : MaterialApp(
              home: Scaffold(
                body: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/icon.png"), fit: BoxFit.fitWidth, opacity: 220),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView(
                      children: <Widget>[
                        preferences != null
                            ? Text(
                                "Design : " + preferences!.getString(mSharedPreference().design).toString() + "  Job : " + preferences!.getString(mSharedPreference().jobNumber).toString(),
                                textAlign: TextAlign.center,
                              )
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
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
                        imageFile != null
                            ? Image.file(
                                imageFile!,
                                fit: BoxFit.contain,
                              )
                            : GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Wrap(
                                        children: [
                                          const ListTile(
                                            title: Text(
                                              'Upload Via',
                                              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              _getFromCamera();
                                            },
                                            child: const ListTile(
                                              leading: Icon(Icons.camera),
                                              title: Text('Camera'),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              _getFromGallery();
                                            },
                                            child: const ListTile(
                                              leading: Icon(Icons.image),
                                              title: Text('Gallery'),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  //_getFromGallery();
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
                                  setState(() {
                                    isLoading = true;
                                  });
                                  apiService.uploadImage(jobNo, preferences!.getString(mSharedPreference().userID).toString(), imageFile!.uri).then((value) => {
                                        if (value.contains("Success"))
                                          {Provider.of<AppModel>(context, listen: false).updateTitle("HOME")}
                                        else
                                          {
                                            setState(() {
                                              isLoading = false;
                                            }),
                                            mUtis.mToast('Enter User ID')
                                          }
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
            ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      imageQuality: 20,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _cropImage();
        print("image ");
        print(imageFile);
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      imageQuality: 20,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _cropImage();
        print("image ");
        print(imageFile);
      });
    }
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9]
            : [CropAspectRatioPreset.original, CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio5x3, CropAspectRatioPreset.ratio5x4, CropAspectRatioPreset.ratio7x5, CropAspectRatioPreset.ratio16x9],
        androidUiSettings: AndroidUiSettings(toolbarTitle: 'Cropper', toolbarColor: Colors.deepOrange, toolbarWidgetColor: Colors.white, initAspectRatio: CropAspectRatioPreset.original, lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }
}
