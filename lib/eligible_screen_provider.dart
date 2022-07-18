
import 'package:flutter/cupertino.dart';

class EligibleScreenProvider extends ChangeNotifier{
  String _message = "You have not given any input";
  bool _isEligible = false;

  String get message => _message;

  bool get isEligible => _isEligible;

  void checkEligibility(int age){
    if(age >= 18){
      _message = "You are eligible to marry";
      _isEligible = true;
    }else{
      _message = "You are not eligible to marry";
      _isEligible = false;
    }
    notifyListeners();
  }
}