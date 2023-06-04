import 'dart:ui';

import 'package:flutter/material.dart';

import '../Utilities/constant.dart';

class BlurButtons extends StatelessWidget {

  const BlurButtons({super.key, required this.label,required this.tap});

  final String label;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        tap();
      },
      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 20.0, sigmaY: 20.0),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 100,
            child: Center(
                child: Text(
                    label,
                    style: k16_400
                )),
          ),
        ),
      ),
    );
  }
}