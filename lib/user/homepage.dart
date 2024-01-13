
// class Homepage extends StatefulWidget {
//   Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {



//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           Align(
//             alignment: Alignment(0.0, 1.0),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(24),
//                 ),
//                 child: BottomNavigationBar(
//                   elevation: 10,
//                   items: const [
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.home,),
//                       label: "Home",
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.edit_calendar),
//                       label: "Appointment",
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.person_2_outlined),
//                       label: "Profile",
//                     ),
//                   ],
//                   selectedItemColor: Colors.white,
//                   unselectedItemColor: Color(0xff988A9A),
//                   showSelectedLabels: true,
//                   showUnselectedLabels: false,
//                   backgroundColor: Colors.black.withOpacity(0.7),
//                   onTap: (int value1) {
//                     setState(() {
//                       currentIndex = value1;
//                       pageController.jumpToPage(value1);
//                     });
//                     print(value1);
//                   },
//                   currentIndex: currentIndex,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
