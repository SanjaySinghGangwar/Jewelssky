import 'package:flutter_app_restart/flutter_app_restart.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class mFunction{
  static restart()async{
    mUtis.mToast("Please Wait");
    await FlutterRestart.restartApp();
  }
}
