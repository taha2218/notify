import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  void postFrameCallback(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed('/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mounted hook
    WidgetsBinding.instance
        .addPostFrameCallback((_) => postFrameCallback(context));

    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
            ),

            Text('Application Logo'),

            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
            ),

            // Progress
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 96.0,
                child: LinearProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
