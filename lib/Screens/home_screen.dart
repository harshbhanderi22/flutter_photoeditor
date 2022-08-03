import 'dart:io';
import 'dart:ui';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:photoeditor/Screens/image_editing_screen.dart';
import 'package:photoeditor/Utilities/constant.dart';
import 'package:photoeditor/Widget/home_drawer.dart';

import '../Service/image_pick_crop.dart';
import '../Widget/home_screen_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late File croppedimage;
  late File pickedimage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        drawer: HomeDrawer(),
        appBar: AppBar(
          title: Text("UEditor", style: k20_400),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                        depth: 3,
                        lightSource: LightSource.bottomRight,
                        intensity: 0.5,
                    ),
                    child: Image.asset(
                      kpath + "logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          HomeScreenButton(
                            label: "Chhoose Photo",
                            tap: () {
                              _showMyDialog();
                            },
                          ),
                        HomeScreenButton(
                          label: "Your Photo",
                          tap: () {
                            print("Your Photo");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Color(0xFF282828),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            content: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () async {
                        // Step #1: Pick Image From Galler.
                        await Utils.pickImageFromGallery()
                            .then((pickedFile) async {
                          // Step #2: Check if we actually picked an image. Otherwise -> stop;
                          if (pickedFile == null) return;
                          // Step #3: Crop earlier selected image
                          await Utils.cropSelectedImage(pickedFile.path)
                              .then((croppedFile) {
                            // Step #4: Check if we actually cropped an image. Otherwise -> stop;
                            if (croppedFile == null) return;
                            // Step #5: Display image on screen
                            setState(() {
                              croppedimage = croppedFile;
                              pickedimage = pickedFile;
                            });
                          });
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageEditingScreen(
                                    croppedimage, pickedimage)));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                offset: Offset(-6.0, -6.0),
                                blurRadius: 16.0,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: Offset(6.0, 6.0),
                                blurRadius: 16.0,
                              ),
                            ],
                            gradient: RadialGradient(colors: [
                              Color(0xFF4B4B4B),
                              Color(0xFF3A3A3A),
                            ], radius: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "From Storage",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () async {
                        await Utils.pickImageFromCamera()
                            .then((pickedFile) async {
                          if (pickedFile == null) return;
                          await Utils.cropSelectedImage(pickedFile.path)
                              .then((croppedFile) {
                            if (croppedFile == null) return;
                            setState(() {
                              croppedimage = croppedFile;
                              pickedimage = pickedFile;
                            });
                          });
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageEditingScreen(
                                    croppedimage, pickedimage)));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                offset: Offset(-6.0, -6.0),
                                blurRadius: 16.0,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: Offset(6.0, 6.0),
                                blurRadius: 16.0,
                              ),
                            ],
                            gradient: RadialGradient(colors: [
                              Color(0xFF4B4B4B),
                              Color(0xFF3A3A3A),
                            ], radius: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "From Camera",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
