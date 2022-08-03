import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FilterRowButton extends StatefulWidget {

  FilterRowButton({required this.image,required this.label,required this.tap});

  final String image;
  final String label;
  final Function tap;

  @override
  State<FilterRowButton> createState() => _FilterRowButtonState();
}

class _FilterRowButtonState extends State<FilterRowButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: (){
          widget.tap();
        },
        child: Container(
          height: MediaQuery.of(context).size.height/10,
           decoration: BoxDecoration(
             color: Color(0xFF3F3F3F),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: Offset(-10.0, -10.0),
                blurRadius: 20.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(6.0, 6.0),
                blurRadius: 16.0,
              ),
            ]
           ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height/14,
                  width: MediaQuery.of(context).size.width/6,
                    child: Image.asset(widget.image,fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 5,),
              Center(child: Text("${widget.label}", textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
