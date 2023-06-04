import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:photoeditor/Service/ads.dart';

class FilterRowButton extends StatefulWidget {

  const FilterRowButton({super.key, required this.image,required this.label,required this.tap});

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
          const  FaceBookAds().showInter();

          widget.tap();
        },
        child: Container(
          height: MediaQuery.of(context).size.height/10,
           decoration: BoxDecoration(
             color: const Color(0xFF3F3F3F),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: const Offset(-10.0, -10.0),
                blurRadius: 20.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(6.0, 6.0),
                blurRadius: 16.0,
              ),
            ]
           ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/14,
                  width: MediaQuery.of(context).size.width/6,
                    child: Image.asset(widget.image,fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(height: 5,),
              Center(child: Text(widget.label, textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 8
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
