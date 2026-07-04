import 'package:flutter/material.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/manner_icon.dart';

class IconGrid extends StatelessWidget {
  const IconGrid({required this.icons});

  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: icons
                .take(3)
                .map((e) => Expanded(child: MannerIcon(path: e)))
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: icons
                .skip(3)
                .take(3)
                .map((e) => Expanded(child: MannerIcon(path: e)))
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...icons
                  .skip(6)
                  .take(2)
                  .map((e) => Expanded(child: MannerIcon(path: e))),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}