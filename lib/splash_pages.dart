import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> with TickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    })..repeat(
      reverse: true
    );

    _animationController.forward().whenComplete(() {
      Navigator.pushReplacementNamed(context, "/login");
    });

    // Timer(
    //   const Duration(seconds: 5),
    //   () => Navigator.pushReplacementNamed(context, "/login"),
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("INi Splash Screen"),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              value: _animationController.value,
              minHeight: 7,
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.blueGrey.shade300,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
