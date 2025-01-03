// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static final double _VerticalSpaceSmall = 1.hp;
  static final double _VerticalSpaceMedium = 5.hp;
  static final double _VerticalSpaceLarge = 10.hp;
  static final double _VerticalSpaceExtraLarge = 15.hp;

  // Vertical spacing constants. Adjust to your liking.
  static final double _HorizontalSpaceSmall = 1.wp;
  static final double _HorizontalSpaceMedium = 5.wp;
  static final double _HorizontalSpaceLarge = 10.wp;
  static final double _HorizontalSpaceExtraLarge = 15.wp;

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceExtraLarge() {
    return verticalSpace(_VerticalSpaceExtraLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_HorizontalSpaceLarge);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceExtraLarge() {
    return horizontalSpace(_HorizontalSpaceExtraLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}
