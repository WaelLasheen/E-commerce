import 'package:e_commerce/Model/productModel.dart';
import 'package:flutter/material.dart';

class Purchasses extends ChangeNotifier{
  int _num=1;
  Map<productModel,int> myPurchasses={};

  get num=>_num;

  void increment(){
    
    _num++;
    notifyListeners();
  }

  void decrement(){
    if(_num>1) {
      _num--;
      notifyListeners();
    }
  }

  void returnTo1(){
    _num = 1;
    notifyListeners();
  }

  void buy(productModel iteam){
    myPurchasses[iteam]=_num;
    returnTo1();
    notifyListeners();
  }

}