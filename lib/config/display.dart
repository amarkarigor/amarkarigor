import 'package:flutter/cupertino.dart';

double getSliderHeight(double height) {
  if (height >= 768) {
    return height * .6;
  } else if (height >= 600) {
    return height * .5;
  }
  return height * .3;
}
