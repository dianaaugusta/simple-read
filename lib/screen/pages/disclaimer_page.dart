import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_read_v2/screen/atoms/red_button.dart';
import 'package:simple_read_v2/screen/pages/home.dart';
import 'package:simpleread_design_system/tokens/colors.dart';
import 'package:simpleread_design_system/tokens/sizes.dart';
import 'package:simpleread_design_system/tokens/typography.dart';

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2, right: 5.0),
            child: ListView(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Disclaimer",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: SimplereadColors.disclaimerColor,
                          fontSize: SimplereadTypography.sizeXXL,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: SimplereadSizes.sizeXXXS),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Esse aplicativo foi feito apenas para fins educativos "
                          "e sem fins lucrativos. "
                          "\n\nAo acessar o mesmo, você concorda "
                          "que não está usando-o de má fé e irá APENAS o utilizar "
                          "para fins pessoais",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: SimplereadSizes.sizeXXS,
                            color: SimplereadColors.fontStrongGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
           Positioned.fromRelativeRect(
            rect: RelativeRect.fromLTRB(-101, 300, 150, -20),
            child: Redbutton(
              pageName: 'main',
            ),
          ),
        ],
      ),
    );
  }
}
