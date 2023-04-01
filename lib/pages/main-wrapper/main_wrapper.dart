import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/pages/faworite_page/faworite_page.dart';
import 'package:plant_app/pages/home_page/home_page.dart';
import 'package:plant_app/pages/profile_page/profile_page.dart';
import 'package:plant_app/pages/qr_code_scaner/qr_code_scaner.dart';
import 'package:plant_app/pages/shop_page/shop_page.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

int indexNavBar = 0;
final PageController pageController = PageController(initialPage: 0);

class _MainWrapperState extends State<MainWrapper> {
  final List<String> titleList = <String>[
    "خانه",
    "علاقه‌مندی‌ها",
    "سبد‌خرید",
    "پروفایل"
  ];
  final List<IconData> iconNavBarList = <IconData>[
    Icons.home,
    Icons.favorite_rounded,
    Icons.shopping_cart,
    Icons.person
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: themeData.iconTheme.color,
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 18),
            child: Text(
              titleList[indexNavBar],
              style: themeData.textTheme.bodySmall,
            ),
          )
        ],
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            indexNavBar = value;
          });
        },
        controller: pageController,
        children: const [
          HomePage(),
          FavouritePage(),
          ShopPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          activeColor: themeData.primaryColor,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          icons: iconNavBarList,
          activeIndex: indexNavBar,
          onTap: (int value) {
            setState(() => indexNavBar = value);
            pageController.animateToPage(indexNavBar,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          }),
      floatingActionButton: SizedBox(
        width: 67,
        height: 67,
        child: FloatingActionButton(
          backgroundColor: themeData.primaryColor,
          onPressed: () {
            Navigator.of(context).push(PageTransition(
                child: QrCodeScaner(
                  size: size,
                  themeData: themeData,
                ),
                type: PageTransitionType.bottomToTop));
          },
          child: Image.asset("assets/images/code-scan-two.png", width: 36),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
