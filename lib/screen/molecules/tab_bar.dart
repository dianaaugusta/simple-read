import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simpleread_design_system/tokens/colors.dart';
import 'package:simpleread_design_system/tokens/sizes.dart';

class SimplereadTabbar extends StatelessWidget {
  const SimplereadTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: TabBarView(
          children: [
            Stack(
            children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  (MediaQuery.of(context).size.width * 0.625).toDouble()),
              painter: RPSCustomPainter(),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                    const Icon(
                      size: SimplereadSizes.sizeXS,
                        IconData(
                          0xe3dc,
                            fontFamily: 'MaterialIcons',
                        )
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                    const Icon(
                      size: SimplereadSizes.sizeXS,
                        IconData(
                          0xf036c,
                          fontFamily: 'MaterialIcons',
                        )
                    ),

                  ],
                ),
              ),
            ],
          )],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = SimplereadColors.frameColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0, size.height * 0);
    path0.quadraticBezierTo(size.width * 0.0003250, size.height * 0.5,
        size.width * 0.5, size.height * 0.5);
    path0.quadraticBezierTo(
        size.width * 1, size.height * 0.5, size.width * 1, size.height * 0);
    // path0.quadraticBezierTo(size.width*0.1859125,size.height*0.3500200,size.width*0.3596875,size.height*0.2858600);
    path0.lineTo(size.width * 1, size.height * 0.0020200);
    path0.lineTo(size.width * 0.7, size.height * 0.0020200);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
