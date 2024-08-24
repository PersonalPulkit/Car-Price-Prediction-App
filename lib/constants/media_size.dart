import 'package:flutter/material.dart';

class MediaSize {
  static bool isCompact(Size size) {
    if (size.width <= 600) {
      return true;
    } else {
      return false;
    }
  }

  static bool isMedium(Size size) {
    if ((size.width > 600) && (size.width <= 900)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isExpanded(Size size) {
    if (size.width > 900) {
      return true;
    } else {
      return false;
    }
  }
}
