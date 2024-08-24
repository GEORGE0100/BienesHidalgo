import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget deskopScaffold;

  const ResponsiveLayout(
      {super.key, required this.mobileScaffold, required this.deskopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 1100) {
        return mobileScaffold;
      } else {
        return deskopScaffold;
      }
    });
  }
}
