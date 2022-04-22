import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Common/Loader.dart';
import 'package:jewelssky/Common/mFunction.dart';
import 'package:jewelssky/HttpService/APIService.dart';
import 'package:jewelssky/Model/Login/LoginRequest.dart';
import 'package:jewelssky/Model/VerifyOtp/VerifyOtpRequest.dart';
import 'package:jewelssky/Utils/AppModel.dart';
import 'package:jewelssky/Utils/mSharedPreference.dart';
import 'package:jewelssky/Utils/mUtils.dart';
import 'package:provider/provider.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isLoading = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  APIService apiService = APIService();

  SharedPreferences? preferences;

  @override
  void initState() { FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loader()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: mUtis.backgroundColorr,
            ),
            home: Scaffold(
              resizeToAvoidBottomInset: false,
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
                        height: 60,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: mUtis.backgroundColorr, fontWeight: FontWeight.w500, fontSize: 40),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'User ID',
                            fillColor: mUtis.backgroundColorr,
                            hoverColor: mUtis.backgroundColorr,
                            focusColor: mUtis.backgroundColorr,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            fillColor: mUtis.backgroundColorr,
                            hoverColor: mUtis.backgroundColorr,
                            focusColor: mUtis.backgroundColorr,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: mobileController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Mobile',
                            fillColor: mUtis.backgroundColorr,
                            hoverColor: mUtis.backgroundColorr,
                            focusColor: mUtis.backgroundColorr,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: mUtis.backgroundColorr,
                          child: const Text('Login'),
                          onPressed: () {
                            if (nameController.text.isNotEmpty && passwordController.text.isNotEmpty && mobileController.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                              LoginRequest request = LoginRequest(user_id: nameController.text, user_pwd: passwordController.text, mob: mobileController.text);

                              apiService.login(request).then((value) => {
                                    if (value.messageId == 1)
                                      {
                                        print("Showing"),
                                        mUtis.mToastSuccess("Otp send successfully"),
                                        showModalBottomSheet(
                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) => Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 18),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Verify Phone",
                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Image.asset(
                                                        'assets/otp.png',
                                                        height: 150,
                                                        width: 150,
                                                      ),
                                                      Text(
                                                        "You will be receiving code on " + mobileController.text,
                                                        style: const TextStyle(fontSize: 15),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                        child: TextField(
                                                          keyboardType: Platform.isIOS?
                                                          TextInputType.numberWithOptions(signed: true, decimal: true)
                                                              : TextInputType.number,
                                                          controller: otpController,
                                                          decoration: InputDecoration(
                                                            border: const OutlineInputBorder(),
                                                            labelText: 'OTP',
                                                            fillColor: mUtis.backgroundColorr,
                                                            hoverColor: mUtis.backgroundColorr,
                                                            focusColor: mUtis.backgroundColorr,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      Center(
                                                        child: Card(
                                                          elevation: 10,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                isLoading = true;
                                                              });
                                                              VerifyOtpRequest request = VerifyOtpRequest(user_id: nameController.text, otp: otpController.text);
                                                              apiService.verifyOTP(request).then((value) => {
                                                                    setState(() {
                                                                      isLoading = false;
                                                                    }),
                                                                    if (value.messageId == 1)
                                                                      {
                                                                        preferences?.setBool(mSharedPreference().isLogin, true), preferences?.setString(mSharedPreference().userID, nameController.text), preferences?.setString(mSharedPreference().mobile, mobileController.text),mFunction.restart()
                                                                      }
                                                                    else
                                                                      {mUtis.mToastError(value.message.toString())}
                                                                  });
                                                            },
                                                            child: const Padding(
                                                              padding: EdgeInsets.all(15.0),
                                                              child: Text(
                                                                "Verify",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          color: mUtis.backgroundColorr,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20),
                                                    ],
                                                  ),
                                                ))
                                      }
                                    else
                                      {mUtis.mToast(value.message.toString())},
                                    setState(() {
                                      isLoading = false;
                                    }),
                                    //print(value.toJson())
                                  });
                              //hitApiForLogin(nameController.text, passwordController.text, mobileController.text);

                            } else {
                              if (nameController.text.isEmpty) {
                                mUtis.mToast('Enter User ID');
                              } else if (passwordController.text.isEmpty) {
                                mUtis.mToast('Enter Password');
                              } else if (mobileController.text.isEmpty) {
                                mUtis.mToast('Enter Mobile number');
                              }
                            }
                          },
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
    this.preferences = await SharedPreferences.getInstance();
  }
}
