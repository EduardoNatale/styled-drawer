import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_drawer/utils/utils.dart';
import 'package:styled_drawer/views/drawer/styled_drawer.dart';
import 'package:styled_drawer/providers/drawer_provider.dart';
import 'package:styled_drawer/views/drawer/drawer_view.dart';

class ScaffoldDrawer extends StatefulWidget {
  const ScaffoldDrawer({Key key}) : super(key: key);

  @override
  _ScaffoldDrawerState createState() => _ScaffoldDrawerState();
}

class _ScaffoldDrawerState extends State<ScaffoldDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Utils.longAnimationDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _drawerProvider = Provider.of<DrawerProvider>(context)
      ..animationController = _animationController;

    return Scaffold(
      body: Stack(
        children: [
          DrawerView(),
          StyleDrawer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _drawerProvider.handleDrawer,
        child: AnimatedIcon(
          progress: _animationController,
          icon: AnimatedIcons.menu_close,
          color: Colors.black,
        ),
      ),
    );
  }
}
