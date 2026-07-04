import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/header_cell.dart';

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
          child: HeaderCell(
            color: AppPallete.headerDark,
            child: Text(
              gregorianDate,
              textAlign: TextAlign.center,
              style: headerTextStyle(),
            ),
          ),
        ),

        Expanded(
          child: HeaderCell(
            color: AppPallete.headerDarker,
            child: Text(
              masjidName,
              textAlign: TextAlign.center,
              style: headerTextStyle(),
            ),
          ),
        ),

        Expanded(
          child: HeaderCell(
            color: AppPallete.headerDark,
            child: Text(
              hijriDate,
              textAlign: TextAlign.center,
              style: headerTextStyle(),
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