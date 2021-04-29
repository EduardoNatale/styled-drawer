import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_drawer/providers/drawer_provider.dart';
import 'package:styled_drawer/views/home/home_page.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _drawerProvider = Provider.of<DrawerProvider>(context);

    return PageView(
      controller: _drawerProvider.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
}
