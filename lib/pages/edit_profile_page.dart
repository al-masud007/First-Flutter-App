import 'package:first_app/cmponents/app_text_feild.dart';
import 'package:first_app/cmponents/tool_bar.dart';
import 'package:first_app/cmponents/user_avatar.dart';
import 'package:first_app/config/app_string.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:first_app/styles/app_text.dart';
import 'package:flutter/material.dart';

enum Gender { none, male, female, others }

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: AppString.editProfile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: UserAvatar(
                      size: 120,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              const AppTextFeild(hint: AppString.firstName),
              const SizedBox(
                height: 16,
              ),
              const AppTextFeild(hint: AppString.lastName),
              const SizedBox(
                height: 16,
              ),
              const AppTextFeild(hint: AppString.phoneNum),
              const SizedBox(
                height: 16,
              ),
              const AppTextFeild(hint: AppString.location),
              const SizedBox(
                height: 16,
              ),
              const AppTextFeild(hint: AppString.birth),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
                decoration: BoxDecoration(
                  color: AppColors.feildcolor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.gender,
                      style: AppText.body1.copyWith(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(AppString.male),
                            value: Gender.male,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            groupValue: gender,
                            onChanged: (value) {
                              setState(
                                () {
                                  gender = Gender.male;
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(AppString.female),
                            value: Gender.female,
                            groupValue: gender,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            onChanged: (value) {
                              setState(
                                () {
                                  gender = Gender.female;
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(AppString.others),
                            value: Gender.others,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            groupValue: gender,
                            onChanged: (value) {
                              setState(
                                () {
                                  gender = Gender.others;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
