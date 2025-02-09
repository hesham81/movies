import 'package:flutter/material.dart';
import 'package:movies/core/extensions/dimensions.dart';

extension on num {
  EdgeInsets verEdge(double value) =>
      EdgeInsets.symmetric(vertical: value.height);

  EdgeInsets horEdge(double value) =>
      EdgeInsets.symmetric(horizontal: value.width);

  EdgeInsets allEdge(double value) => EdgeInsets.all(value);

  EdgeInsets topEdge(double value) => EdgeInsets.only(top: value.height);

  EdgeInsets bottomEdge(double value) => EdgeInsets.only(bottom: value.height);

  EdgeInsets leftEdge(double value) => EdgeInsets.only(left: value.width);

  EdgeInsets rightEdge(double value) => EdgeInsets.only(right: value.width);
}
