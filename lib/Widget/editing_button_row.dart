import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EditingButtonRow extends StatefulWidget {

  EditingButtonRow({required this.icon,required this.label,required this.tap});

  final IconData icon;
  final String label;
  final Function tap;

  @override
  State<EditingButtonRow> createState() => _EditingButtonRowState();
}

class _EditingButtonRowState extends State<EditingButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: (){
          widget.tap();
        },
        child: Container(
          height: MediaQuery.of(context).size.height/11,
          width: MediaQuery.of(context).size.width/6,
          decoration: BoxDecoration(
              color: Color(0xFF3F3F3F),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  offset: Offset(-6.0, -6.0),
                  blurRadius:50.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon),

              Center(child: Text("${widget.label}", textAlign: TextAlign
                  .center ,style: TextStyle(
                  fontSize: 10
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
