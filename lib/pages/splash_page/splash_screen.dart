import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/pages/main-wrapper/main_wrapper.dart';
import 'package:plant_app/pages/splash_page/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> setBoolFirst() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isFirstTime', false);
    }

    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    int pageIndex = 0;
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotWidth: 12,
                  activeDotColor: themeData.primaryColor,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: themeData.primaryColor,
                ),
                onPressed: () {
                  if (pageIndex < 2) {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    pageIndex++;
                  } else {
                    setBoolFirst();
                    Navigator.of(context).pushReplacement(PageTransition(
                        child: const MainWrapper(),
                        type: PageTransitionType.leftToRight));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "رد کردن",
              style: themeData.textTheme.titleSmall,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        controller: controller,
        children: Pages.of(context),
        onPageChanged: (value) {
          pageIndex = value;
        },
      ),
    );
  }
}
