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
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(Utils.drawerRadius),
        ),
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
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.drawerHorizontalPadding,
                            ),
                            height: Utils.drawerItemHeight,
                            child: Row(
                              children: <Widget>[
                                Icon(drawerItem.icon),
                                SizedBox(width: Utils.spaceBetween),
                                Expanded(
                                  child: Text(
                                    drawerItem.title,
                                    textScaleFactor: 1,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: Utils.spaceBetween),
                          Container(
                            padding: EdgeInsets.only(
                              left: Utils.drawerHorizontalPadding +
                                  24 +
                                  Utils.spaceBetween,
                              right: Utils.drawerHorizontalPadding,
                            ),
                            child: drawerItem.child,
                          )
                        ],
                      ),
                    ),
                    button(_drawerProvider),
                  ],
                ),
              ),
              _shadow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shadow() {
    if (index != 0)
      return Positioned.fill(
        child: IgnorePointer(
          child: CustomPaint(
            painter: ShadowPainter(),
          ),
        ),
      );

    return SizedBox.shrink();
  }

  Widget button(DrawerProvider drawerProvider) {
    if (index == drawerProvider.currentIndex && drawerItem.showButton)
      return Align(
        alignment: Alignment(1, 1),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(
                bottom: Utils.drawerHorizontalPadding - 8,
                right: Utils.drawerHorizontalPadding - 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: Text(drawerItem.buttonTitle)),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Utils.drawerHorizontalPadding - 8,
                    right: Utils.drawerHorizontalPadding - 8,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      Utils.patternRadius,
                    ),
                    onTap: () => drawerProvider.goToPage(index),
                  ),
                ),
              ),
            )
          ],
        ),
      );

    return SizedBox.shrink();
  }
}
