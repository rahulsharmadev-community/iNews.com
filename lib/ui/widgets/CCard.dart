import 'package:flutter/material.dart';
import '/helper/txt.dart';

class CCard extends StatelessWidget {
  final Size size;
  final String title, content, image;
  final double iconWidth;

  const CCard(
      {Key? key,
      required this.size,
      required this.image,
      required this.title,
      required this.content,
      this.iconWidth = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox.fromSize(
        size: size,
        child: Stack(
          children: [
            Positioned.fill(
              top: iconWidth / 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 78.35,
                    ),
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 17.24,
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(18, iconWidth / 2, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Txt(title, style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: size.height * 0.06),
                    Txt(
                      content,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: size.width / 10,
              top: 0,
              child: FittedBox(
                child: SizedBox.square(
                  dimension: iconWidth,
                  child: Image.asset(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
