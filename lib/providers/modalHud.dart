import 'package:flutter/material.dart';
class ModalHud extends ChangeNotifier
{
bool isLoading =false;
changeIsLoading(value){
 isLoading=value;
 notifyListeners();
}
}