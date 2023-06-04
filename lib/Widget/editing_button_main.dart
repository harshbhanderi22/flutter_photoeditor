import 'package:flutter/material.dart';
import 'package:photoeditor/Service/ads.dart';

class EditingButton extends StatefulWidget {
  const EditingButton(
      {super.key, required this.icon, required this.label, required this.tap});

  final IconData icon;
  final String label;
  final Function tap;

  @override
  State<EditingButton> createState() => _EditingButtonState();
}

class _EditingButtonState extends State<EditingButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          const FaceBookAds().showInter();

          widget.tap();
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 6,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 5.0,
                ),
              ],
              color: const Color(0xFF4B4B4B),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon),
              const SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 9.5),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
