import 'package:flutter/material.dart';

List<DrawerItemModel> get drawerItems {
  return [
    DrawerItemModel(
      icon: Icons.calendar_today,
      title: "CALENDAR",
      toRoute: "calendar",
      widthPercentage: 1,
      color: Colors.orange,
    ),
    DrawerItemModel(
      icon: Icons.bar_chart,
      title: "SEASON STATS",
      toRoute: "season_stats",
      widthPercentage: .9,
      color: Colors.orange[600],
    ),
    DrawerItemModel(
      icon: Icons.ac_unit,
      title: "CONDITIONS",
      toRoute: "/conditions",
      widthPercentage: .8,
      color: Colors.orange[700],
    ),
    DrawerItemModel(
      icon: Icons.map_sharp,
      title: "MAPS",
      toRoute: "/maps",
      widthPercentage: .7,
      color: Colors.orange[800],
    ),
    DrawerItemModel(
      icon: Icons.account_circle,
      title: "PROFILE",
      toRoute: "/profile",
      widthPercentage: .6,
      color: Colors.orange[900],
    ),
  ];
}

class DrawerItemModel {
  final IconData icon;
  final String title;
  final String toRoute;
  final String details;
  final double widthPercentage;
  final Color color;

  DrawerItemModel({
    @required this.icon,
    @required this.title,
    @required this.toRoute,
    @required this.widthPercentage,
    @required this.color,
    this.details,
  });
}
