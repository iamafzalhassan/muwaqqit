import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.gregorianDate,
    required this.masjidName,
    required this.hijriDate,
  });

  final String gregorianDate;
  final String masjidName;
  final String hijriDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _HeaderCell(
            color: AppPallete.headerDark,
            child: Text(
              gregorianDate,
              textAlign: TextAlign.center,
              style: _headerTextStyle(),
            ),
          ),
        ),

        Expanded(
          child: _HeaderCell(
            color: AppPallete.headerDarker,
            child: Text(
              masjidName,
              textAlign: TextAlign.center,
              style: _headerTextStyle(),
            ),
          ),
        ),

        Expanded(
          child: _HeaderCell(
            color: AppPallete.headerDark,
            child: Text(
              hijriDate,
              textAlign: TextAlign.center,
              style: _headerTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _headerTextStyle() => const TextStyle(
    fontFamily: AppFont.productSansThin,
    fontSize: 20,
    color: AppPallete.textWhite,
    letterSpacing: 2,
    fontWeight: FontWeight.w300,
  );
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 68,
      alignment: Alignment.center,
      child: child,
    );
  }
}