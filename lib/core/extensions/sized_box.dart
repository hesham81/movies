import 'package:flutter/material.dart';
import '/core/extensions/extensions.dart';

extension sized on num {
  Widget horSpace() {
    return SizedBox(
      height: this.height,
    );
  }

  Widget verSpace() {
    return SizedBox(
      width: this.width,
    );
  }
}
