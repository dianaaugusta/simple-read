import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:simple_read_v2/screen/pages/home.dart';
import 'package:simpleread_design_system/themes/themes.dart';
import 'package:simpleread_design_system/tokens/colors.dart';
import 'package:simpleread_design_system/tokens/sizes.dart';

class Redbutton extends StatelessWidget {
  final String pageName;
  const Redbutton({Key? key, required this.pageName}) : super(key: key);
  //MediaQuery.of(context).size.height - 100
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: SizedBox(
        height: 200.0,
        width: 200.0,
        child: FloatingActionButton(
          onPressed: () {
           Get.toNamed('/${pageName}');
          },
          isExtended: false,
          backgroundColor: SimplereadColors.frameColor,
          child: const Text(
              'Acessar',
               style: TextStyle(
                 fontSize: SimplereadSizes.sizeXXS,
                 color: SimplereadColors.subtitleColor,
               ),
          ),
        ),
      ),
    );
  }
}
