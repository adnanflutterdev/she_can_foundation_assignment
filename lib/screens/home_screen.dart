import 'package:flutter/material.dart';
import 'package:she_can_foundation/utils/colors.dart';
import 'package:she_can_foundation/utils/tabs.dart';
import 'package:she_can_foundation/utils/tabs_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: tabs.length,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder: (context, index) => tabs[index],
              ),
            ),
            Container(
              color: container,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  tabsIcon.length,
                  (index) => GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 399),
                        curve: Curves.easeIn,
                      );
                    },
                    child: SizedBox(
                      width: screenWidth / 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            tabsIcon[index]['icon'],
                            color: _currentPage == index
                                ? primaryAccent
                                : white,
                          ),
                          Text(
                            tabsIcon[index]['title'],
                            style: TextStyle(
                              color: _currentPage == index
                                  ? primaryAccent
                                  : textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
