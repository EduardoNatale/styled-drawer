import 'package:flutter/material.dart';
import 'package:styled_drawer/utils/utils.dart';

class HomePage extends StatelessWidget {
  final images = [
    'https://picsum.photos/500',
    'https://picsum.photos/600',
    'https://picsum.photos/700'
  ];

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photos",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(Utils.patternPadding),
        itemCount: images.length,
        separatorBuilder: (_, __) => SizedBox(height: Utils.spaceBetween),
        itemBuilder: (_, index) => ClipRRect(
          borderRadius: BorderRadius.circular(Utils.patternRadius),
          child: Image.network(images[index]),
        ),
      ),
    );
  }
}
