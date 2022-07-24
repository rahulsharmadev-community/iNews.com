import 'package:flutter/material.dart';

class Moniter extends StatelessWidget {
  final double height;
  final Color bodyColor;
  final  Color displayColor;
  final BorderRadius? borderRadius;
  final Widget? child;

  const Moniter(
      {Key? key,
      this.borderRadius,
      required this.height,
      this.bodyColor = const Color(0xffD7D7D7),
      this.displayColor = const Color(0xffF3F3F3),
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = height * 1.55;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: width / 4,
            height: double.maxFinite,
            color: bodyColor,
          ),
          Container(
            width: width / 2,
            height: width * 0.02,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: const Border.fromBorderSide(BorderSide.none),
              color: bodyColor,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: width,
                height: height * 0.88,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: bodyColor,
                ),
                padding: EdgeInsets.all(width * 0.02),
                child: Material(
                  color: displayColor,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    clipBehavior: Clip.hardEdge,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
