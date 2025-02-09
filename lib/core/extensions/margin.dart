import 'package:flutter/material.dart';

extension margin on Widget {
  marginBottom(double i) {
    return Container(
      margin: EdgeInsets.only(bottom: i),
    );
  }
  marginTop(double i) {
    return Container(
      margin: EdgeInsets.only(top:  i),
    );
  }
  marginLeft(double i) {
    return Container(
      margin: EdgeInsets.only(left:   i),
    );
  }
  marginRight(double i) {
    return Container(
      margin: EdgeInsets.only(right:    i),
    );
  }
  marginVertical(double i) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:     i),
    );
  }
  marginHorizontal(double i) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:      i),
    );
  }
  marginAll(double i) {
    return Container(
      margin: EdgeInsets.all( i),
    );
  }

}
