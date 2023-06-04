import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../Utilities/constant.dart';

class HomeScreenButton extends StatelessWidget {

  const HomeScreenButton({super.key, required this.label,required this.tap});
  final String label;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        tap();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child:  Container(
          height: MediaQuery.of(context).size.height/13,
          width: MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
              color: const Color(0x1AAFAFAF),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],

          ),
          child: Center(child: Text(label, style: k20_400,)),
        ),
      ),
    );
  }
}