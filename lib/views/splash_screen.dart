import 'package:flutter/material.dart';
import 'package:myapp/config/my_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/icons/splash_icon.png')),
          Center(
            child: CircularProgressIndicator(
              color: MyColors.colorPrimary,
              strokeWidth: 5,
              backgroundColor: Colors.teal[900],
            ),
          )
        ],
      ),
    );
  }
}
