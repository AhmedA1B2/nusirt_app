import 'package:flutter/material.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/shadow/text_shadow.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    if (sharedPref.getString("num") == null ||
        sharedPref.getString("emil") == null) {
      ogToOp();
    }
    if (sharedPref.getString("num") != null) {
      ogToHome();
    }
    if (sharedPref.getString("emil") != null) {
      ogToHomeTe();
    }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: Image.asset('image/home/Sirt.png'),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: fadingAnimation!,
            child: TextShadow(
              text: "Welcome",
              color: colorSplash,
            ),
          ),
        ],
      ),
    );
  }

  void ogToOp() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('op');
    });
  }

  void ogToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("homes");
    });
  }

  void ogToHomeTe() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("homet");
    });
  }
}
