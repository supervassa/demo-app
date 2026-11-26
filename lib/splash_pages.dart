import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          })
          ..repeat(reverse: true);

    _animationController.forward().whenComplete(() async {
      final pref = await SharedPreferences.getInstance();
      final IsLoggedIn = pref.getBool('is_logged_in') ?? false;

      if (!mounted) return; // memastikan widget aktif
      Navigator.pushReplacementNamed(context, IsLoggedIn ? '/home' : '/login');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "SELAMAT DATANG KEMBALI di \nSIAKAD POLMAIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Container(
            //   margin: EdgeInsets.all(8),
            //   height: 100,
            //   width: 100,
            //   child: Image.network(
            //     "https://play-lh.googleusercontent.com/_wCvAIKdFwlZnhz6nDydxijbgT1UJqb0weTWL-uNd9-D7vcqufazebv_ZHX-S10nPA2krQoAKZovEY5K9TfECw",
            //   ),
            // ),
            Container(
              margin: EdgeInsets.all(8),
              height: 100,
              width: 100,
              child: Image.asset('assets/logo_polmain.png'),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(8),
              child: LinearProgressIndicator(
                value: _animationController.value,
                minHeight: 7,
                borderRadius: BorderRadius.circular(8),
                backgroundColor: Colors.blueGrey.shade300,
                color: Colors.deepOrangeAccent,
              ),
            ),
            Text(
              "Versi App 1.0",
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
