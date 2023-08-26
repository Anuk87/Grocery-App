import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/controllers/auth_contoller.dart';
import 'package:grocery_app/screens/main/home/widgets/product_grid.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../components/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetConstants.menuIcon),
                Row(
                  children: [
                    SvgPicture.asset(AssetConstants.cartIcon),
                    IconButton(
                        onPressed: () {
                          AuthController().logOut();
                        },
                        icon: Icon(Icons.logout)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            const TextWidget(
              "Vegetables",
              fontSize: 25,
              textAlign: TextAlign.center,
              color: AppColorss.primaryColor,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 41),
            ProductGrid()
          ],
        ),
      ),
    );
  }
}
