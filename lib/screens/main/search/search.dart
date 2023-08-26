import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../../components/custom_text.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget('Search',
          color: AppColorss.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500),
    );
  }
}
