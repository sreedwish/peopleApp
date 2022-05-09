import 'package:flutter/material.dart';
import 'package:people_app/blocs/users/user_bloc.dart';
import 'package:people_app/constants.dart';
import 'package:people_app/uiUtilities/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      gotoNext();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      Navigator.of(context).popAndPushNamed(routeUsers);
    });
  }
}
