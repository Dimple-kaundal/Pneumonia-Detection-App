import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFun {
  static navigateToPage( context,Widget pageName){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> pageName));
  }
  static navigateToPageWithoutBack(context,Widget pageName){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> pageName), (Route<dynamic> route)=>false);

  }
}