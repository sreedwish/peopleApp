import 'package:flutter/material.dart';
import 'package:people_app/constants.dart';
import 'package:people_app/uiUtilities/styles.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      gotoNext();
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'People App',
              style: headline1.copyWith(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            )
          ],
        ),
      ),
    );
  }

  void gotoNext() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      Navigator.of(context).pushNamed(routeUsers);
    });
  }
}
