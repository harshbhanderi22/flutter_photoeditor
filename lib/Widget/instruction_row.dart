import 'package:flutter/material.dart';

class InstructionRow extends StatelessWidget {
  const InstructionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Select any Funcationaly from Bottom\n and Enjoy new "
          "Exeperiecne of Editing",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Color(0xFF676767)


      ),
      ),
    );
  }
}
