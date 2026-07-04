import 'package:flutter/material.dart';
import 'package:muwaqqit/core/constants/asset_constants.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/icon_grid.dart';

class MannersPanel extends StatelessWidget {
  const MannersPanel({super.key});

  static const icons = [
    AssetConstants.speaker,
    AssetConstants.slippers,
    AssetConstants.run,
    AssetConstants.spit,
    AssetConstants.water,
    AssetConstants.garbage,
    AssetConstants.food,
    AssetConstants.smoke,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.panelGrey,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 15),
          label('MASJID MANNERS'),
          SizedBox(height: 15),
          Expanded(child: IconGrid(icons: icons)),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget label(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 35,
      color: AppPallete.textDark,
      letterSpacing: 2,
      fontWeight: FontWeight.w300,
    ),
    textAlign: TextAlign.center,
  );
}