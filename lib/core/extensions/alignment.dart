import 'package:flutter/material.dart';

extension alignment on Widget {
  Widget get center => Align(
        alignment: Alignment.center,
        child: this,

      );

  Widget get left => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );

  Widget get right => Align(
        alignment: Alignment.bottomRight,
        child: this,
      );

  Widget get top => Align(
        alignment: Alignment.topCenter,
        child: this,
      );

  Widget get bottom => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );

  Widget get topLeft => Align(
        alignment: Alignment.topLeft,
        child: this,
      );

  Widget get topRight => Align(
        alignment: Alignment.topRight,
        child: this,
      );

  Widget get bottomLeft => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );
}
