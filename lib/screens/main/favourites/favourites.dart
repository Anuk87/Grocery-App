import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../../components/custom_text.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget('Favourites',
          color: AppColorss.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500),
    );
  }
}
