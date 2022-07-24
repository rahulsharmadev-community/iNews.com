import 'package:flutter/material.dart';

enum LayoutSize { Null, Compact, Medium, Expended }

ScaffoldMessengerState get messenger => Config.messengerKey.currentState!;

NavigatorState get navigation => Config.navigatorKey.currentState!;

class Config {
  Config._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static double get screenWidth => _mediaQueryData.size.width;

  static double get screenHeight => _mediaQueryData.size.height;

  static late MediaQueryData _mediaQueryData;

  static Orientation get orientation => _mediaQueryData.orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _layoutSize = _setlayoutSize();
  }

  static late LayoutSize _layoutSize;
  static LayoutSize get layoutSize => _layoutSize;

  /// ![](https://miro.medium.com/max/963/0*oPd79x6WOCdQAhvD.png)
  /// ![](https://miro.medium.com/max/963/0*jP_sMyX7M4e_O97J.png)
  static LayoutSize _setlayoutSize() {
    if (screenHeight > 500 && screenWidth > 380) {
      return (screenWidth > screenHeight)
          ? (screenHeight / screenWidth) > .8
              ? LayoutSize.Medium
              : LayoutSize.Expended
          : screenWidth / screenHeight < .8
              ? LayoutSize.Compact
              : LayoutSize.Medium;
    } else {
      return LayoutSize.Null;
    }
  }
}

bool get isMedium => LayoutSize.Medium == Config.layoutSize;
bool get isCompact => LayoutSize.Compact == Config.layoutSize;
bool get isExpended => LayoutSize.Expended == Config.layoutSize;

// Get the proportionate height as per screen size
double flexHeight(double inputHeight) {
  double screenHeight = Config.screenHeight;
// 812 is the layout height that designer use
  var flexHeight = (inputHeight / 812) * screenHeight;
  return flexHeight < screenHeight ? flexHeight : screenHeight;
}

// Get the proportionate height as per screen size
double flexWidth(double inputWidth) {
  double screenWidth = Config.screenWidth;
// 375 is the layout width that designer use
  var flexWidth = (inputWidth / 375) * screenWidth;
  return flexWidth < inputWidth ? flexWidth : inputWidth;
}

double widthOf(double percentage) => Config.screenWidth * percentage * .01;

double heightOf(double percentage) => Config.screenHeight * percentage * .01;
