import 'package:flutter/material.dart';

import '../../main.dart';

extension dimension on num {
  double get height =>
      this * MediaQuery.sizeOf(navigatorKey.currentContext!).height;

  double get width =>
      this * MediaQuery.of(navigatorKey.currentContext!).size.width;
}
