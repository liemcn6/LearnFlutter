import 'package:testagain/shared/customvalues.dart';
import 'package:testagain/shared/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeSreen extends StatefulWidget {
  int index;
  HomeSreen({super.key, required this.index});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  var Screens = [
      //const Homescreenbody(),
      //const Searchscreenbody(),
      //const Morescreenbody()
    ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Backgroupimage(imageback: selectedbackimg),
            Screens[widget.index],
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 60.0,
          index: widget.index,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: uppermodecolor,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: uppermodecolor,
            ),
            Icon(
              Icons.menu,
              size: 30,
              color: uppermodecolor,
            ),
          ],
          color: Colors.white10,
          buttonBackgroundColor: Colors.white10,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) => setState(() {
            widget.index = index;
          }),
          letIndexChange: (index) => true,
        )
      ));
  }
}