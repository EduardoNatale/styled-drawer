import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_drawer/providers/drawer_provider.dart';
import 'package:styled_drawer/utils/utils.dart';

class StyleDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _drawerProvider = Provider.of<DrawerProvider>(context);

    return Column(
      children: [
        AnimatedBuilder(
          animation: _drawerProvider.animationController,
          builder: (_, child) => Transform.translate(
            offset: _drawerProvider.offset(0, .6),
            child: child,
          ),
          child: Container(
            height: Utils.appBarHeight + MediaQuery.of(context).padding.top,
            color: Colors.orange,
            padding: EdgeInsets.fromLTRB(
              Utils.drawerHorizontalPadding,
              MediaQuery.of(context).padding.top,
              Utils.drawerHorizontalPadding,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "FLUTTER",
                  textScaleFactor: 1.6,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (_, boxConstraints) {
              _drawerProvider.setMaxItemHeight(boxConstraints);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _drawerProvider.buildItems(),
              );
            },
          ),
        )
      ],
    );
  }
}
