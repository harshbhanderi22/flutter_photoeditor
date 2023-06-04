import 'package:flutter/material.dart';

const kpath = "assests/images/";

const k16_400 =
    TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400,);

// ignore: constant_identifier_names
const k16_400_blue =
    TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w400);

const k20_400 =
    TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400,);

const k20_600 =
    TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600);

const k14_400 =
    TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400);

const k14_400_blue =
    TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w400);

const k12_100 =
TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w100);

const k12_100_blue =
TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w100);

const k30_900 =
    TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900);

const k25_600 =
    TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600);




const NO_FILTER =
    [1.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0];

const SEPIA_MATRIX =
    [0.39, 0.769, 0.189, 0.0, 0.0,
    0.349, 0.686, 0.168, 0.0, 0.0,
    0.272, 0.534, 0.131, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0];

const DARK_MATRIX =
    [0.25, 0.25, 0.25, 0.0, 0.0,
        0.25, 0.25, 0.25, 0.0, 0.0,
        0.25, 0.25, 0.25, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0];


const VINTAGE_MATRIX =
    [0.9, 0.5, 0.1, 0.0, 0.0,
    0.3, 0.8, 0.1, 0.0, 0.0,
    0.2, 0.3, 0.5, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0];

const SWEET_MATRIX =
    [1.0, 0.0, 0.2, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0];

const GREYSCALE_MATRIX=
    [0.213,  0.715,  0.072,  0.000, -0.104,
        0.213,  0.715,  0.072,  0.000, -0.104,
        0.213,  0.715,  0.072,  0.000, -0.104,
        0.000,  0.000,  0.000,  1.000,  0.000];

const HUE_MATRIX =
    [
        0.010, -0.009,  0.999,  0.000,  0.000,
        0.353,  0.859, -0.212,  0.000, 0.000,
        -0.577,  1.420,  0.156,  0.000,  0.000,
        0.000, 0.000,  0.000,  1.000,  0.000,
    ];

const BLUE_MATRIX=[
    0.250,  0.250,  0.2250,  0.000,  0.000,
    0.250 , 0.250,  0.250,  0.000, 0.000,
    0.1  ,0.250,  1.000,  0.000,  0.000,
    1.000 , 1.000,  1.000,  1.000,  1.000,
];

const INVERTED_MATRIX =
    [-1.0, 0.0, 0.0, 0.0, 255.0,
    0.0, -1.0, 0.0, 0.0, 255.0,
    0.0, 0.0, -1.0, 0.0, 255.0,
    0.0, 0.0, 0.0, 1.0, 0.0];

const CONTRAST_MATRIX =
    [
        1.4000,  0.000,  0.000,  0.000, -0.500,
        0.000,  1.400,  0.000,  0.000,-0.500,
        0.000,  0.000,  1.400,  0.000, -0.500,
        0.000,  0.000,  0.000,  1.000,  0.000,
    ];

const SATURATION_MATRIX=
[
    1.580, -0.527, -0.053,  0.000,  0.000,
    -0.157,  1.210, -0.053,  0.000,  0.000,
    -0.157, -0.527,  1.680,  0.000,  0.000,
    0.000 , 0.000,  0.000,  1.000,  0.000
];


const EXPOSURE_MATRIX=
    [
        1.500,  0.000,  0.000,  0.000,  0.500,
        0.000,  1.500,  0.000,  0.000,  0.500,
        0.000,  0.000, 1.500,  0.000,  0.500,
        0.000,  0.000,  0.000,  1.000,  0.000,
    ];



