import 'package:bieneshidalgo/responsive_pages/desktop_responsive.dart';
import 'package:bieneshidalgo/responsive_pages/mobile_responsive.dart';
import 'package:bieneshidalgo/responsive_pages/responsive_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
            mobileScaffold: MobileScaffold(),
            deskopScaffold: DesktopScaffold()));
  }
}
