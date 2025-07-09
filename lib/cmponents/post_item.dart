import 'package:first_app/config/app_config.dart';
import 'package:first_app/data/model/post.dart';
import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

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
              Text(
                '${post.owner?.firstName} ${post.owner?.lastName}',
                style: AppText.subtitle3,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Image.network('${AppConfig.baseurl}${post.image}'),
          Text(
            post.message ?? '',
            //'The sun is a daily reminder that we too can rise from the darkness, that we too can shine our own light 🌞💖',
            style: AppText.subtitle3,
          ),
        ],
      ),
    );
  }
}
