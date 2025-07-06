import 'package:first_app/cmponents/bottomnavigation_item.dart';
import 'package:first_app/config/app_icons.dart';
import 'package:first_app/config/app_string.dart';
import 'package:first_app/model/user.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // ignore: non_constant_identifier_names
  Menues CurrentIndex = Menues.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[CurrentIndex.index],
      bottomNavigationBar: MybottomNavigation(
        CurrentIndex: CurrentIndex,
        onTap: (Menues value) {
          setState(() {
            CurrentIndex = value;
          });
        },
      ),
    );
  }

  final pages = [
    HomePage(),
    Center(
      child: Text(AppString.favorite),
    ),
    Center(
      child: Text(AppString.post),
    ),
    Center(
      child: Text(AppString.messages),
    ),
    ProfilePage()
  ];
}

enum Menues { home, favorite, add, message, profile }

class MybottomNavigation extends StatelessWidget {
  final Menues CurrentIndex;
  final ValueChanged<Menues> onTap;
  // ignore: non_constant_identifier_names
  const MybottomNavigation(
      {super.key, required this.CurrentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 17,
              child: Container(
                  height: 70,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        )),
                    child: Row(
                      children: [
                        Expanded(
                            child: BottomnavigationItem(
                                onPressed: () => onTap(Menues.home),
                                icon: AppIcon.icHome,
                                current: CurrentIndex,
                                name: Menues.home)),
                        Expanded(
                            child: BottomnavigationItem(
                                onPressed: () => onTap(Menues.favorite),
                                icon: AppIcon.icFavorite,
                                current: CurrentIndex,
                                name: Menues.favorite)),
                        Spacer(),
                        Expanded(
                            child: BottomnavigationItem(
                                onPressed: () => onTap(Menues.message),
                                icon: AppIcon.icMessage,
                                current: CurrentIndex,
                                name: Menues.message)),
                        Expanded(
                            child: BottomnavigationItem(
                                onPressed: () => onTap(Menues.profile),
                                icon: AppIcon.icProfile,
                                current: CurrentIndex,
                                name: Menues.profile))
                      ],
                    ),
                  ))),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menues.add),
              child: Container(
                height: 64,
                width: 64,
                decoration: const BoxDecoration(
                    color: Colors.amber, shape: BoxShape.circle),
                child: SvgPicture.asset(AppIcon.icAdd),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
