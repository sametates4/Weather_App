import 'package:flutter/cupertino.dart';

mixin CustomSizedBox{
  static sizedBox({required double value}){
    return SizedBox(height: value,);
  }
}