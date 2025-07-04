import 'package:first_app/cmponents/post_item.dart';
import 'package:first_app/cmponents/tool_bar.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/pages/nearby_page.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUserFromServer();
    return Scaffold(
      appBar: Toolbar(
        title: 'Hello, Welcome Back',
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.nearby);
              },
              icon: SvgPicture.asset('assets/svg/location.svg'))
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(user: users[index]);
        },
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 24,
          );
        },
      ),
    );
  }

  mockUserFromServer() {
    for (var i = 0; i < 100; i++) {
      users.add('user number $i');
    }
  }
}
