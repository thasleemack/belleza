
import 'package:flutter/material.dart';
import 'package:makeupproject/user/profile_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'Home.dart';
import 'add_appointment.dart';


class Bottombar extends StatefulWidget {
  String userId;
  String userName;
  String name;
  String phone;
  String address;



   Bottombar({super.key, required this.userId, required this.userName,required this.name,required this.phone,required this.address});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
   int selectedIndex = 0;



   @override
   void _itemTapped(int index){
     setState(() {
       selectedIndex = index;
       print(selectedIndex.toString()+"ppkk");
     });

   }


  @override
  Widget build(BuildContext context) {
    var pages = [
      Home(userId: widget.userId,userName: widget.userName),
      AddAppointment( userId:widget.userId,),
      ProfilePage( userId:widget.userId,name: widget.name,phone: widget.phone,address: widget.address, )
    ];

    return Scaffold(
      body: pages[selectedIndex],

      extendBody: true,
      bottomNavigationBar:  DotNavigationBar(
        margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
         // enableFloatingNavBar: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff988A9A),
        backgroundColor: Colors.black.withOpacity(0.7),
        currentIndex: selectedIndex,

        onTap: _itemTapped,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.edit_calendar),

          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),

          ),
        ],

      ),
    );
  }
}
