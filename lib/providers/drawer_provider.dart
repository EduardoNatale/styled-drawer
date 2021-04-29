import 'package:flutter/material.dart';
import 'package:styled_drawer/views/drawer/drawer_item_widget.dart';
import 'package:styled_drawer/models/drawer_item_model.dart';
import 'package:styled_drawer/utils/utils.dart';

class DrawerProvider with ChangeNotifier {
  PageController pageController = PageController();

  AnimationController animationController;
  bool isDrawerOpen = false;
  int currentIndex = 0;
  double maxItemHeight;

  void handleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    if (isDrawerOpen)
      animationController.forward();
    else
      animationController.reverse();
    notifyListeners();
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void setMaxItemHeight(BoxConstraints boxConstraints) {
    maxItemHeight = boxConstraints.maxHeight -
        ((drawerItems.length - 1) * Utils.drawerItemHeight);
  }

  Offset offset(double start, double end) {
    return Tween<Offset>(
      begin: Offset(-Utils.width, 0),
      end: Offset(0, 0),
    )
        .animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(start, end, curve: Utils.curves),
          ),
        )
        .value;
  }

  List<Widget> buildItems() {
    return drawerItems.asMap().entries.map<Widget>((entry) {
      final drawerItem = entry.value;
      final index = entry.key;

      return DrawerItemWidget(
        drawerItem: drawerItem,
        index: index,
      );
    }).toList();
  }
}
