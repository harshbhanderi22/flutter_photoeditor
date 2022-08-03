import 'package:flutter/material.dart';
import 'package:photoeditor/Screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/login_page.dart';
import 'Screens/sign_up.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.hasError){
                return Center(child: Text("Something Went Wrong"),);
              }
              else if(snapshot.hasData)
              {
                return Center(child: HomeScreen());
              }
              else {
                return Login();
              }

            }
        ),
      ),
    );
  }
}
