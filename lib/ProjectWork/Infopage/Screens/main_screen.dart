import 'package:flutter/material.dart';
import 'package:pw/ProjectWork/Infopage/Screens/home.dart';

class PlantInfoMainScreen extends StatefulWidget {
  @override
  _PlantInfoMainScreenState createState() => _PlantInfoMainScreenState();
}

class _PlantInfoMainScreenState extends State<PlantInfoMainScreen> {
  late PageController _pageController;
  int _page = 0;

  List icons = [
    Icons.home,
    Icons.label,
    Icons.add,
    Icons.notifications,
    Icons.person,
  ];
  static const IconData refresh = IconData(0xe514, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) => Home()),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            SizedBox(width: 7),
          ],
        ),
        //color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),

    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
