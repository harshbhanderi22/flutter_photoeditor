import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photoeditor/Widget/editing_button_row.dart';
import 'package:photoeditor/Widget/instruction_row.dart';
 import '../Service/image_pick_crop.dart';
import '../Utilities/constant.dart';
import '../Widget/editing_button_main.dart';
import '../Widget/filter_row_button.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageEditingScreen extends StatefulWidget {
  ImageEditingScreen(this.croppedimagepath, this.pickedimagepath);

  final File croppedimagepath;
  final File pickedimagepath;

  @override
  State<ImageEditingScreen> createState() => _ImageEditingScreenState();
}

class _ImageEditingScreenState extends State<ImageEditingScreen> {
  final GlobalKey _repaintkey = GlobalKey();
  late File croppedimage = widget.croppedimagepath;
  late File pickedimage = widget.pickedimagepath;
  late File val;
  int i = 0;
  int p = 0;
  late double phorizontal=0;
  late double pvertical=0;
  late double pall=0;
  late double borderwidth=0;
  late double borderadius=0;
  late double brightness_value = 1;
  late double contrast_value = 1;
  late double radius = 0;
  late double t=(1-contrast_value)/2;
  late String valueText;
  late double lposition=0;
  late double tposition=0;
  var filenamecontroller=TextEditingController();
  bool toolsboxvisibility = false;


  void convertWidgetToImage( ) async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      RenderRepaintBoundary boundary =
      _repaintkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio:50);
      ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png) as Future<ByteData?>);
      if (byteData != null) {
        final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List(),);
        print(result);
        Fluttertoast.showToast(msg: "Image Saved Successfully");
      }
     }
    else{
      Permission.storage.request();
    }
  }

  @override
  List<double> filter = NO_FILTER;

Widget build(BuildContext context) {

    List<double> BRIGHTNESS =
    [brightness_value, 0.0, 0.0, 0.0, 0.0,
      0.0, brightness_value, 0.0, 0.0, 0.0,
      0.0, 0.0, brightness_value, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0];

    List<double> CONTRAST =
    [contrast_value, 0.0, 0.0, 0.0, 0.0,
      0.0, contrast_value, 0.0, 0.0, 0.0,
      0.0, 0.0, contrast_value, 0.0, 0.0,
      0.0, 0.0, 0.0, 1.0, 0.0];

    List<EdgeInsets> PaddingType=[
    EdgeInsets.symmetric(horizontal: phorizontal),
    EdgeInsets.symmetric(vertical: pvertical),
    EdgeInsets.all(pall)
    ];


    List<Widget> RowsForButtons = [
      //i=0
      InstructionRow(),
      //Crop Row(i=1)
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EditingButtonRow(
                icon: Icons.crop,
                label: "Current Image",
                tap: () async {
                  await Utils.cropSelectedImage(croppedimage.path)
                      .then((croppedFile) {
                    if (croppedFile == null) return;
                    setState(() {
                      croppedimage = croppedFile;
                    });
                  });
                }),
            EditingButtonRow(
                icon: Icons.crop,
                label: "Picked Image",
                tap: () async {
                  await Utils.cropSelectedImage(pickedimage.path)
                      .then((croppedFile) {
                    if (croppedFile == null) return;
                    setState(() {
                      croppedimage = croppedFile;
                    });
                  });
                }),
          ],
        ),
      ),
      //Filter Row(i=2)
      Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "NO FILTER",
                  tap: () {
                    setState(() {
                      filter = NO_FILTER;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "GREY SCALE",
                  tap: () {
                    setState(() {
                      filter = GREYSCALE_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "CONTRAST",
                  tap: () {
                    setState(() {
                      filter = CONTRAST_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "SATURATION",
                  tap: () {
                    setState(() {
                      filter = SATURATION_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "EXPOSURE",
                  tap: () {
                    setState(() {
                      filter = EXPOSURE_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "BLUE",
                  tap: () {
                    setState(() {
                      filter = BLUE_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "HUE",
                  tap: () {
                    setState(() {
                      filter = HUE_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "DARK",
                  tap: () {
                    setState(() {
                      filter = DARK_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "SEPIA",
                  tap: () {
                    setState(() {
                      filter = SEPIA_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "SWEET",
                  tap: () {
                    setState(() {
                      filter = SWEET_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "VINTAGE",
                  tap: () {
                    setState(() {
                      filter = VINTAGE_MATRIX;
                    });
                  }),
              FilterRowButton(
                  image: kpath + "logo.png",
                  label: "INVERTED",
                  tap: () {
                    setState(() {
                      filter = INVERTED_MATRIX;
                    });
                  }),
            ],
          ),
        ),
      ),
      //Brightness Slider(i=3)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Brightness", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: brightness_value,
              min: 0.5,
              max: 2,
              onChanged: (double value) {
                setState(() {
                  brightness_value = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //Contrast SLider(i=4)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Contrast", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: contrast_value,
              min: 0.5,
              max: 3,
              onChanged: (double value) {
                print(value);
                setState(() {
                  contrast_value = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //Radius SLider(i=5)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Radius", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: radius,
              min: 0,
              max: 200,
              onChanged: (double value) {
                print(value);
                setState(() {
                  radius = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //Padding Types(i=6)
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EditingButtonRow(
                icon: Icons.padding,
                label: "Horizontal",
                tap:  (){
                  setState((){
                      i=7;
                      p=0;
                  });
                }
            ),
            EditingButtonRow(
                icon: Icons.padding,
                label: "Vertical",
                tap:  (){
                  setState((){
                    i=8;
                    p=1;
                  });
                }
            ),
            EditingButtonRow(
                icon: Icons.padding,
                label: "All",
                tap:  (){
                  setState((){
                    i=9;
                    p=2;
                  });
                }
            ),
          ],
        ),
      ),
      //Horizontal Padding(i=7)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Horizontal Padding", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: phorizontal,
              min: 0,
              max: 50,
              onChanged: (double value) {
                print(value);
                setState(() {
                  phorizontal = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //Vertical Padding(i=8)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Vertical Padding", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: pvertical,
              min: 0,
              max: 50,
              onChanged: (double value) {
                print(value);
                setState(() {
                  pvertical = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //All Padding(i=9)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Padding All", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: pall,
              min: 0,
              max: 50,
              onChanged: (double value) {
                print(value);
                setState(() {
                  pall = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //Border Width(i=10)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Border Width", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: borderwidth,
              min: 0,
              max: 20,
              onChanged: (double value) {
                print(value);
                setState(() {
                  borderwidth = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
      //Border Radius(i=11)
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Border Radius", style: k14_400,),
          SliderTheme(
            data: SliderThemeData(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Color(0xFFEA4848),
                overlayColor: Color(0x30000000),
                thumbColor: Color(0xFFEA4848),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: borderadius,
              min: 0,
              max: 100,
              onChanged: (double value) {
                print(value);
                setState(() {
                  borderadius = value.toDouble();
                });
              },
            ),
          ),
        ],
      ),
    ];

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF313030),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: Text("UEditor", style: k20_400),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){
                   convertWidgetToImage();
                },
                icon: Icon(Icons.save)
        )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/1.10,
                    width: MediaQuery.of(context).size.width,
                    child: croppedimage != null
                        ? Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 0,
                              right: 0,
                              child: RepaintBoundary(
                                  key: _repaintkey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(borderadius)),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: borderwidth,
                                        )
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(radius),
                                      child: Padding(
                                        padding: PaddingType[p],
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.matrix(CONTRAST),
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.matrix(BRIGHTNESS),
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.matrix(filter),
                                              child: Image.file(
                                                croppedimage,
                                                width: MediaQuery.of(context).size.width,
                                                height: MediaQuery.of
                                                  (context).size.height/1.75,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        )
                        : Container(
                            decoration: BoxDecoration(color: Colors.red[200]),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                  //Row Below Photo with detailed function
                  Positioned(
                    top: MediaQuery.of(context).size.height/1.70,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        child: RowsForButtons[i],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                     child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Center(child: Text("Google Ads")),
                    ),
                  ),
                  //Container with main funcationalities
                  Visibility(
                    visible: toolsboxvisibility,
                    child: Positioned(
                      top: MediaQuery.of(context).size.height/2,
                      child: SingleChildScrollView(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFCECECE),
                              border: Border.all(
                                color: Color(0x1AAFAFAF),
                                width: 0.5
                              ),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                                right: 20,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        EditingButton(
                                          icon: Icons.crop,
                                          label: "Crop",
                                          tap: () {
                                            setState(() {
                                              i = 1;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                        EditingButton(
                                          icon: Icons.photo,
                                          label: "Filter",
                                          tap: () {
                                            setState(() {
                                              i = 2;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                        EditingButton(
                                          icon: Icons.light_mode,
                                          label: "Brightness",
                                          tap: () {
                                            setState(() {
                                              i = 3;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        EditingButton(
                                          icon: Icons.contrast,
                                          label: "Contrast",
                                          tap: () {
                                            setState(() {
                                              i = 4;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                        EditingButton(
                                          icon: Icons.radar,
                                          label: "Radius",
                                          tap: () {
                                            setState(() {
                                              i = 5;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                        EditingButton(
                                          icon: Icons.trip_origin,
                                          label: "Reset All",
                                          tap: () {
                                            setState(() {
                                              filter = NO_FILTER;
                                              brightness_value = 1;
                                              contrast_value = 1;
                                              i = 0;
                                              radius = 0;
                                              pall=0;
                                              pvertical=0;
                                              phorizontal=0;
                                              borderwidth=0;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        EditingButton(
                                          icon: Icons.padding_sharp,
                                          label: "Padding",
                                          tap: () {
                                            setState(() {
                                              i = 6;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                        EditingButton(
                                          icon: Icons.border_all,
                                          label: "Border",
                                          tap: () {
                                            setState(() {
                                              i = 10;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),
                                        EditingButton(
                                          icon: Icons.panorama_wide_angle,
                                          label: "Border Radius",
                                          tap: () {
                                            setState(() {
                                              i = 11;
                                              toolsboxvisibility=false;
                                            });
                                          },
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  //Google Ads
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
           child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFF3F3E3E),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState((){
                        toolsboxvisibility = !toolsboxvisibility;
                      });
                    },
                      child: Text("Tools", style: k20_600,),
                  ),
                  VerticalDivider(
                    width: 60,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                      onTap: (){
                        print("Share");
                      },
                      child: Text("Share", style: k20_600,),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
