import 'package:hotelp/views/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SplashPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const Home()), (route) => false);

      _timer.cancel();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/animations/splash.png'),
                width: 200,
                height: 200,
              ),
              SizedBox(
                  height: 16), // Adjust the spacing between the image and text
              Text(
                'WedLock',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
