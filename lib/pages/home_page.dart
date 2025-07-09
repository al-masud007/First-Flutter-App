import 'package:first_app/cmponents/post_item.dart';
import 'package:first_app/cmponents/tool_bar.dart';
import 'package:first_app/config/app_routes.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/pages/nearby_page.dart';
import 'package:first_app/provider/post_provider.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return PostItem(
                post: value.list[index],
              );
            },
            itemCount: value.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 24,
              );
            },
          );
        },
      ),
    );
  }
}
