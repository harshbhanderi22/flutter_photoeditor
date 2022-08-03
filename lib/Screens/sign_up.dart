import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photoeditor/Screens/login_page.dart';
import 'package:photoeditor/Widget/blue_submit_buttons.dart';

import '../Utilities/constant.dart';
import 'home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKeySignup = GlobalKey<FormState>();

  var _namecontroller=TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passwordcontroller=TextEditingController();

  void moveToLogin(BuildContext context) async {
    if (_formKeySignup.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    height:  MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration:   BoxDecoration(
                      image:  DecorationImage(
                          image:  AssetImage(kpath + "back2.png"),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top:30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Welcome UEditor",textAlign:
                                TextAlign.center,
                                  style: k30_900),
                                SizedBox(height: 20,),
                                Text("Your Own Editor", style: k25_600
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY:5.0),
                                child: Container(
                                  margin: EdgeInsets.all(40),
                                  height: MediaQuery.of(context).size
                                      .height/1,
                                  width: MediaQuery.of(context).size.width-100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Form(
                                    key: _formKeySignup,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Sign Up", style: k20_400),
                                        SizedBox(height: 10,),
                                        TextFormField(
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 26),
                                          controller: _namecontroller,
                                          decoration: InputDecoration(
                                            hintText: "Name",
                                            prefixIcon: Icon(Icons.person,color:
                                            Colors.white,),
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1.5),
                                                borderRadius: BorderRadius.circular(15.0)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white, width:
                                                1.5),
                                                borderRadius: BorderRadius.circular(15.0)),
                                          ),
                                          validator: (value){
                                            if(value!.isEmpty || value == null) {
                                              return "Name cannot be empty";
                                            }
                                            else
                                              {
                                                return null;
                                              }
                                            },
                                        ),
                                        SizedBox(height: 20,),
                                        TextFormField(
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 26),
                                          controller: _emailcontroller,
                                          decoration: InputDecoration(
                                            hintText: "Email",
                                            prefixIcon: Icon(Icons.email_sharp,color:
                                            Colors.white,),
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1.5),
                                                borderRadius: BorderRadius.circular(15.0)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white, width:
                                                1.5),
                                                borderRadius: BorderRadius.circular(15.0)),
                                          ),
                                          validator: (value){
                                            if(value!.isEmpty || value == null) {
                                              return "Email cannot be empty";
                                            }
                                            if(!value.contains('@')){
                                              return "Invalid Email";
                                            }
                                            else
                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 20,),
                                        TextFormField(
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 26),
                                          controller: _passwordcontroller,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            prefixIcon: Icon(Icons.lock,color:
                                            Colors.white,),
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1.5),
                                                borderRadius: BorderRadius.circular(15.0)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white, width:
                                                1.5),
                                                borderRadius: BorderRadius.circular(15.0)),
                                          ),
                                          validator: (value){
                                            if(value!.isEmpty || value == null) {
                                              return "Password cannot be empty";
                                            }
                                            if(value.length<8){
                                              return "Password length should "
                                                  "be atleast 8";
                                            }
                                            else
                                            {
                                              return null;
                                            }
                                          },

                                        ),
                                        SizedBox(height: 40,),
                                        BlurButtons(
                                            label: "Sign Up",
                                            tap: (){
                                              moveToLogin(context);
                                            }
                                        ),
                                        SizedBox(height:30,),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Already have a account?",
                                                style: k14_400,
                                              ),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context)=>
                                                          Login()));
                                                },
                                                child: Text("Log In",
                                                  style: k14_400_blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                )
            )
        ),
      ),
    );
  }
}
