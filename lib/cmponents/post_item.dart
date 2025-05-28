import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/673.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(user, style: AppText.subtitle3),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Image.asset('assets/temp/post1.jpg'),
          Text(
            'The sun is a daily reminder that we too can rise from the darkness, that we too can shine our own light 🌞💖',
            style: AppText.subtitle3,
          ),
        ],
      ),
    );
  }
}
