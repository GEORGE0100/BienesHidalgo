import 'package:bieneshidalgo/responsive_pages/responsive_page.dart';
import 'package:bieneshidalgo/users/admin_pages/admin_desktop.dart';
import 'package:bieneshidalgo/users/admin_pages/admin_mobile.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  static String id = 'admin_screen';
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
            mobileScaffold: MobileAdminScaffold(),
            deskopScaffold: DesktopAdminScaffold()));
  }
}
