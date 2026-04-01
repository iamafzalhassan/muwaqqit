import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

abstract class _MannersAssets {
  static const String silent = 'https://www.figma.com/api/mcp/asset/a7a672d7-5be1-4171-a5ea-f3c59d835dc4';
  static const String dontRun = 'https://www.figma.com/api/mcp/asset/39669a22-b602-43ba-8684-540d92d32898';
  static const String water = 'https://www.figma.com/api/mcp/asset/3eb7294e-3374-4fe1-a7c6-75c31eb5645e';
  static const String food = 'https://www.figma.com/api/mcp/asset/a170f176-a9af-469a-bed9-473af57ca06e';
  static const String slippers = 'https://www.figma.com/api/mcp/asset/81b0bce7-3fe1-4c11-b33a-400aa14ac8e0';
  static const String breathable = 'https://www.figma.com/api/mcp/asset/b7844af6-6176-4767-ae19-ba49d8e0a8d4';
  static const String garbage = 'https://www.figma.com/api/mcp/asset/5e09438d-b301-4bc2-bee4-d8b23039a6d5';
  static const String smokingArea = 'https://www.figma.com/api/mcp/asset/6ebb8b25-6e83-45d4-ad85-007e9cf48a3b';
}

class MannersPanel extends StatelessWidget {
  const MannersPanel({super.key});

  static const _icons = [
    _MannersAssets.silent,
    _MannersAssets.slippers,
    _MannersAssets.dontRun,
    _MannersAssets.breathable,
    _MannersAssets.water,
    _MannersAssets.garbage,
    _MannersAssets.food,
    _MannersAssets.smokingArea,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.panelGrey,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _label('MASJID MANNERS'),
          const SizedBox(height: 24),
          _IconGrid(icons: _icons),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 35,
      color: AppPallete.textDark,
      letterSpacing: 3.5,
      fontWeight: FontWeight.w300,
    ),
  );
}

class _IconGrid extends StatelessWidget {
  const _IconGrid({required this.icons});

  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: icons.length,
      itemBuilder: (_, i) => _MannerIcon(url: icons[i]),
    );
  }
}

class _MannerIcon extends StatelessWidget {
  const _MannerIcon({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Icon(Icons.block, color: AppPallete.textDark, size: 48),
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
    );
  }
}