import 'package:final_year_project/views/explore.dart';
import 'package:final_year_project/views/profile.dart';
import 'package:final_year_project/views/products.dart';
import 'package:final_year_project/views/market.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _Footer();
}

class _Footer extends State<Footer> {
  List<Widget> widgetList = [
    const ExplorePage(), //0
    const MarketPage(), //1
    const ProfilePage(), //2
    const ProductPage(), //3
  ];
  int selectedTab = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

//yaha xai error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton.filledTonal(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Farmers 👋🏾",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("Enjoy our services",
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          ),
        ],
      ),
      body: widgetList[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedTab = value;
          });
        },

        //color
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.black38,
        currentIndex: selectedTab,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Market"),
          BottomNavigationBarItem(icon: Icon(Icons.person_3), label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: "test"),
        ], // Replace with your image path
      ),
    );
  }
}
