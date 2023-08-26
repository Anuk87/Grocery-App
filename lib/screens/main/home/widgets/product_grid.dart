import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../../components/custom_text.dart';
import '../../../../utils/app_colors.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 44,
            crossAxisSpacing: 19,
          ),
          itemBuilder: (context, i) {
            return const ProductTile();
          }),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorss.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
            image: NetworkImage(
                'https://hgtvhome.sndimg.com/content/dam/images/hgtv/fullset/2013/9/16/0/Where_do_pumpkins_grow_overhead_view_on_vine_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1400982091403.jpeg'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 8),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColorss.kWhite,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AssetConstants.savIcon),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            height: 38,
            decoration: BoxDecoration(
              color: AppColorss.lightGreen.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextWidget(
                  'Tomato',
                  fontSize: 15,
                  color: AppColorss.kWhite,
                  fontWeight: FontWeight.w500,
                ),
                TextWidget(
                  '\$1.50',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
