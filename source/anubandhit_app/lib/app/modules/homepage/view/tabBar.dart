// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, no_logic_in_create_state

import 'package:anubandhit/app/modules/homepage/view/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../profile/main_profile/view/main_profile.dart';

class TabBarWidget extends StatefulWidget {
  static const route = '/tabbar';
  static launch(BuildContext context) => Navigator.of(context).pushNamed(route);

  const TabBarWidget({
    super.key,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      Container(),
      MainProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home, size: Dimensions.iconSize24 * 1.2),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.mic,
          color: AppColors.white,
          size: Dimensions.iconSize24 * 1.4,
        ),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.orange,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
          size: Dimensions.iconSize24 * 1.2,
        ),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      //* changed the default navBarHeight
      navBarHeight: Dimensions.navBarHeight50,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.lightGrey, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
// Widget build(BuildContext context) {
//   const placeholder = Opacity(
//     opacity: 0,
//     child: IconButton(
//       icon: Icon(Icons.no_cell),
//       onPressed: null,
//     ),
//   );
//   return BottomAppBar(
//     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       buildTabItem(index: 0, icon: const Icon(Icons.home)),
//       SizedBox(width: MediaQuery.of(context).size.width*0.15,),
//       buildTabItem(index: 1, icon: const Icon(Icons.person_off_outlined)),
//     ]),
//   );
// }

// Widget buildTabItem({required int index, required Icon icon}) {
//   return IconButton(onPressed: () {}, icon: icon);
// }
