import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_drawer/providers/drawer_provider.dart';
import 'package:styled_drawer/utils/utils.dart';
import 'package:styled_drawer/views/drawer/scaffold_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.orange,
        ),
        home: LayoutBuilder(
          builder: (context, boxConstraints) {
            Utils.width = boxConstraints.maxWidth;
            return ScaffoldDrawer();
          },
        ),
      ),
    );
  }
}
