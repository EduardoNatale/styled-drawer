import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_drawer/views/drawer/shadow_painter.dart';
import 'package:styled_drawer/models/drawer_item_model.dart';
import 'package:styled_drawer/providers/drawer_provider.dart';
import 'package:styled_drawer/utils/utils.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItemModel drawerItem;
  final int index;

  DrawerItemWidget({this.drawerItem, this.index});

  @override
  Widget build(BuildContext context) {
    final _drawerProvider = Provider.of<DrawerProvider>(context);

    return AnimatedBuilder(
      animation: _drawerProvider.animationController,
      builder: (_, child) => Transform.translate(
        offset: _drawerProvider.offset(
          0,
          .6 + (index * (.4 / (drawerItems.length - 1))),
        ),
        child: child,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
        child: GestureDetector(
          onTap: () => _drawerProvider.changeCurrentIndex(index),
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: Utils.shortAnimationDuration,
                  height: index == _drawerProvider.currentIndex
                      ? _drawerProvider.maxItemHeight
                      : Utils.drawerItemHeight,
                  width: MediaQuery.of(context).size.width *
                      drawerItem.widthPercentage,
                  color: drawerItem.color,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          height: Utils.drawerItemHeight,
                          child: Row(
                            children: <Widget>[
                              Icon(drawerItem.icon),
                              SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  drawerItem.title,
                                  textScaleFactor: 1,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.only(left: 48, right: 32),
                          child: Text("Teste"),
                        )
                      ],
                    ),
                  )),
              index != 0
                  ? Positioned.fill(
                      child: CustomPaint(
                        painter: ShadowPainter(),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
