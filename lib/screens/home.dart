import 'package:flutter/material.dart';
import 'package:notification/widgets/post.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
          ],
        ),
      ),
    );
  }
}