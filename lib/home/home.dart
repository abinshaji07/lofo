import 'package:flower_selling_app/home/screens/buy/buy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'screens/flower_grid_view/flower_grid_view.dart';

import '../widgets/screen_switch.dart';
import 'screens/cart_view/cart_view.dart';
import 'screens/profile_view/profile_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  late PageController controller;
  late ScreenSwitchController screenController;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selectedIndex);
    screenController = ScreenSwitchController(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = theme.colorScheme.secondary;
    final bottomNavigationBarColor =
        theme.bottomNavigationBarTheme.backgroundColor;
    return Scaffold(
      body: ScreenSwitch(
        controller: screenController,
        screens: <Widget>[
          FlowerGridView.show(context),
          CartView.show(context),
           const buy(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: bottomNavigationBarColor!,
        selectedIndex: selectedIndex,
        iconSize: 28,
        barItems: [
          BarItem(title: "HOME", icon: FeatherIcons.home),
           BarItem(title: "CART", icon: FeatherIcons.shoppingCart),
          BarItem(title: "MY ADS", icon: FeatherIcons.plus),
          BarItem(title: "Profile", icon: FeatherIcons.user),
        ],
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          screenController.updateIndex(currentIndex: selectedIndex);
        },
        activeColor: accentColor,
      ),
    );
  }
}
