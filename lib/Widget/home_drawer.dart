import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_entity_entry.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

  String name="Harsh";
  String gmail="harsh@gmail.com";
  String url="https://docs.flutter.dev/assets/images/dash/dash-fainting.gif";

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Drawer(
        child: Container(
          color: const Color(0xFF1B1D21),
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color: Color(0xFF141517)),
                    margin: EdgeInsets.zero,
                    accountName: Text(name),
                    accountEmail: Text(gmail),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(url),
                    )),
              ),
              DrawerEntry(
                  tiltIcon: FontAwesomeIcons.phone,
                  title: "Contact Us",
                  tap: (){},
              ),
              DrawerEntry(
                tiltIcon: FontAwesomeIcons.penClip,
                title: "Feedback",
                tap: (){},
              ),
              DrawerEntry(
                tiltIcon: FontAwesomeIcons.peopleGroup,
                title: "About Us",
                tap: (){},
              ),
              // GestureDetector
              //   (
              //     onTap: (){
              //       final provider=Provider.of<GoogleSingInProivder>(context,
              //           listen: false);
              //       provider.GoogleLogOut();
              //     },
              //     child: DrawerEntry(FontAwesomeIcons.lockOpen, "Log Out")
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
