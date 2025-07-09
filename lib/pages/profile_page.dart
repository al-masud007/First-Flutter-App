import 'package:first_app/cmponents/tool_bar.dart';
import 'package:first_app/cmponents/user_avatar.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/config/app_string.dart';
import 'package:first_app/data/model/user.dart';
import 'package:first_app/provider/app_repo.dart';

import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppRepo>().user;
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
                  value: ProfileMenu.edit,
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                    value: ProfileMenu.logout, child: Text('Log Out'))
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          const UserAvatar(
            size: 90,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            ' ${user?.id} ${user?.firstName} ${user?.lastName}',
            style: AppText.header2,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Madagascar',
            style: AppText.subtitle3,
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
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
