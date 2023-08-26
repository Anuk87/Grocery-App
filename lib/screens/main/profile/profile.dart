import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../../components/custom_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget('Profile',
          color: AppColorss.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500),
    );
  }
}
