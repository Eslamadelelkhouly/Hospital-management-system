import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/favoruits/presentation/views/favourits_screen.dart';
import 'package:healthmate/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:healthmate/features/message/presentation/views/message_screen.dart';
import 'package:healthmate/features/personal/presentation/views/personal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  int selectedTab = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    HomeScreenBody(),
    FavouritsScreen(),
    PersonalScreen(),
  ];

  final List<String> _labels = ["Home", "Favorite", "Messages", "Profile"];
  final List<String> _icons = [homeicon, hearticon, messageicon, profileicon];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: selectedTab > 2 ? selectedTab - 1 : selectedTab,
            height: 75,
            items: List.generate(_icons.length, (i) {
              return ImageIcon(
                AssetImage(_icons[i]),
                color: Colors.white,
              );
            }),
            color: ColorSystem.kPrimaryColor,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: ColorSystem.kPrimaryColor,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (selectedIndex) async {
              if (selectedIndex == 2) {
                // Message screen doesn't change the current index
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(),
                  ),
                );
                // After popping, keep the previous tab highlighted
                setState(() {
                  selectedTab = index;
                });
              } else {
                setState(() {
                  index = selectedIndex > 2 ? selectedIndex - 1 : selectedIndex;
                  selectedTab = selectedIndex;
                });
              }
            },
            letIndexChange: (i) => true,
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_labels.length, (i) {
                return Center(
                  child: Text(
                    _labels[i],
                    textAlign: TextAlign.center,
                    style: StylingSystem.textStyle16Medium.copyWith(
                      color:
                          selectedTab == i ? Colors.white : Colors.transparent,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
