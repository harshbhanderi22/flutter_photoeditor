import 'dart:io';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photoeditor/Screens/image_editing_screen.dart';
import 'package:photoeditor/Service/ads.dart';
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
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
        testingId: "8ebc4066-3412-4823-b2b1-6523a3af16f9"
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        //drawer: const HomeDrawer(),
        appBar: AppBar(
          title: const Text("UEditor", style: k20_400),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height-130 ,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50,  ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(10)),
                          depth: 3,
                          lightSource: LightSource.bottomRight,
                          intensity: 0.5,
                        ),
                        child: Image.asset(
                          "${kpath}logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(

                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                             horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50,),
                            HomeScreenButton(
                              label: "Chhoose Photo",
                              tap: () {
                                _showMyDialog();
                              },
                            ),
                            HomeScreenButton(
                              label: "Your Photo",
                              tap: () {
                                FaceBookAds().showInter();
                                Fluttertoast.showToast(msg: "Coming Soon...");
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
            const FaceBookAds(),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    FaceBookAds().showInter();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: const Color(0xFF282828),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () async {
                        FaceBookAds().showInter();
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
                                offset: const Offset(-6.0, -6.0),
                                blurRadius: 16.0,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(6.0, 6.0),
                                blurRadius: 16.0,
                              ),
                            ],
                            gradient: const RadialGradient(colors: [
                              Color(0xFF4B4B4B),
                              Color(0xFF3A3A3A),
                            ], radius: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
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
                        FaceBookAds().showInter();
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
                                offset: const Offset(-6.0, -6.0),
                                blurRadius: 16.0,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(6.0, 6.0),
                                blurRadius: 16.0,
                              ),
                            ],
                            gradient: const RadialGradient(colors: [
                              Color(0xFF4B4B4B),
                              Color(0xFF3A3A3A),
                            ], radius: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
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


