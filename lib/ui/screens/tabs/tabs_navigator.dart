import 'package:fitcoachaz/ui/screens/main/main_screen.dart';
import 'package:fitcoachaz/ui/screens/tabs/tabs_mixin.dart';
import 'package:fitcoachaz/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs_components.dart';

class TabsNavigator extends StatefulWidget {
  const TabsNavigator({super.key});

  @override
  State<TabsNavigator> createState() => _TabsNavigatorState();
}

class _TabsNavigatorState extends State<TabsNavigator> with TabsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          MainScreen(),
          const Center(child: Text("Book Screen")),
          const Center(child: Text("Profile Screen")),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.h,
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: bottomNavBarItems.asMap().entries.map((e) {
                return InkResponse(
                  overlayColor:
                      MaterialStateProperty.all(AppColors.transparent),
                  onTap: () => setState(() => selectedIndex = e.key),
                  child: BottomNavBar(
                    image: e.value.icon,
                    selected: selectedIndex == e.key,
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
