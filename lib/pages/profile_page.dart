import 'package:first_app/cmponents/tool_bar.dart';
import 'package:first_app/cmponents/user_avatar.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/config/app_string.dart';

import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppString.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editprofile);
                  break;
                case ProfileMenu.logout:
                  print('logout');
                  break;
                default:
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('Edit'),
                  value: ProfileMenu.edit,
                ),
                PopupMenuItem(child: Text('Log Out'), value: ProfileMenu.logout)
              ];
            },
          )
        ],
      ),
      body: const Column(
        children: [
          UserAvatar(
            size: 90,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Mahdi Mirzadeh',
            style: AppText.header2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Madagascar',
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '472',
                    style: AppText.header2,
                  ),
                  Text(AppString.followers, style: AppText.body2)
                ],
              ),
              // SizedBox(
              //   width: 65.9,
              // ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text(AppString.post, style: AppText.body2)
                ],
              ),
              // // SizedBox(
              //   width: 67.12,
              // ),
              Column(
                children: [
                  Text(
                    '860',
                    style: AppText.header2,
                  ),
                  Text(AppString.following, style: AppText.body2)
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
            height: 24,
          )
        ],
      ),
    );
  }
}
