import 'package:flutter/material.dart';
import 'package:muwaqqit/core/constants/asset_constants.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

class MannersPanel extends StatelessWidget {
  const MannersPanel({super.key});

  static const _icons = [
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          _label('MASJID MANNERS'),
          SizedBox(height: 15),
          _IconGrid(icons: _icons),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 35,
      color: AppPallete.textDark,
      letterSpacing: 2,
      fontWeight: FontWeight.w300,
    ),
  );
}

class _IconGrid extends StatelessWidget {
  const _IconGrid({required this.icons});

  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons
              .take(3)
              .map((e) => SizedBox(width: 50, child: _MannerIcon(path: e)))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons
              .skip(3)
              .take(3)
              .map((e) => SizedBox(width: 50, child: _MannerIcon(path: e)))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons
              .skip(6)
              .take(2)
              .map((e) => SizedBox(width: 50, child: _MannerIcon(path: e)))
              .toList(),
        ),
      ],
    );
  }
}

class _MannerIcon extends StatelessWidget {
  const _MannerIcon({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, fit: BoxFit.cover);
  }
}