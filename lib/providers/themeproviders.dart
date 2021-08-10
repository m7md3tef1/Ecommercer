import 'package:flutter/cupertino.dart';

class Themeprovider extends ChangeNotifier
{
  bool islight=true;

  changeTheme(){
    islight =!islight;
    notifyListeners();
  }

}