import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/header_cell.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.gregorianDate,
    required this.hijriDate,
    required this.masjidName,
  });

  final String gregorianDate;
  final String hijriDate;
  final String masjidName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HeaderCell(
            color: AppPallete.headerDark,
            child: Text(
              gregorianDate,
              style: headerTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Expanded(
          child: HeaderCell(
            color: AppPallete.headerDarker,
            child: Text(
              masjidName,
              style: headerTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Expanded(
          child: HeaderCell(
            color: AppPallete.headerDark,
            child: Text(
              hijriDate,
              style: headerTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  TextStyle headerTextStyle() => const TextStyle(
    fontFamily: AppFont.productSansThin,
    fontSize: 25,
    color: AppPallete.textWhite,
    letterSpacing: 2,
    fontWeight: FontWeight.w300,
  );
}