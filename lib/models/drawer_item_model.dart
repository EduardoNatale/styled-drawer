import 'package:flutter/material.dart';
import 'package:styled_drawer/utils/utils.dart';

Column get column => Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
            SizedBox(width: Utils.spaceBetween),
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.spaceBetween),
        Row(
          children: [
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
            SizedBox(width: Utils.spaceBetween),
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.spaceBetween),
        Row(
          children: [
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
            SizedBox(width: Utils.spaceBetween),
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.spaceBetween),
        Row(
          children: [
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
            SizedBox(width: Utils.spaceBetween),
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.spaceBetween),
        Row(
          children: [
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
            SizedBox(width: Utils.spaceBetween),
            Flexible(
              child: Text(
                "XXXX/XX/XX",
                style: Utils.boldText,
              ),
            ),
          ],
        ),
      ],
    );

List<DrawerItemModel> get drawerItems {
  return [
    DrawerItemModel(
      icon: Icons.photo,
      title: "PHOTOS",
      widthPercentage: 1,
      color: Colors.orange,
      showButton: true,
      buttonTitle: "SHOW PHOTOS",
      child: column,
    ),
    DrawerItemModel(
      icon: Icons.bar_chart,
      title: "SEASON STATS",
      widthPercentage: .9,
      color: Colors.orange[600],
      child: column,
    ),
    DrawerItemModel(
      icon: Icons.ac_unit,
      title: "CONDITIONS",
      widthPercentage: .8,
      color: Colors.orange[700],
      showButton: true,
      buttonTitle: "GO TO CONDITIONS",
      child: column,
    ),
    DrawerItemModel(
      icon: Icons.map_sharp,
      title: "MAPS",
      widthPercentage: .7,
      color: Colors.orange[800],
      goDirect: true,
      child: column,
    ),
    DrawerItemModel(
      icon: Icons.account_circle,
      title: "PROFILE",
      widthPercentage: .6,
      color: Colors.orange[900],
      goDirect: true,
      child: column,
    ),
  ];
}

class DrawerItemModel {
  final IconData icon;
  final String title;
  final double widthPercentage;
  final Color color;
  final bool showButton;
  final String buttonTitle;
  final bool goDirect;
  final Widget child;

  DrawerItemModel({
    @required this.icon,
    @required this.title,
    @required this.widthPercentage,
    @required this.color,
    this.child,
    this.buttonTitle,
    this.goDirect = false,
    this.showButton = false,
  }) {
    assert(showButton == false || goDirect == false);
    if (showButton) assert(buttonTitle != null);
  }
}
