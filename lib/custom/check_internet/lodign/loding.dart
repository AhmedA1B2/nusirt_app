import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';

class Loding extends StatefulWidget {
  const Loding({super.key});

  @override
  _LodinggetState createState() => _LodinggetState();
}

class _LodinggetState extends State<Loding> with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> animation1;

  late AnimationController controller2;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();

    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation1 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
          controller2.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation2 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller1.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 70,
          width: 70,
          child: CustomPaint(
            painter: MyPainter(animation1.value, animation2.value),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double Radius_1;
  final double Radius_2;

  MyPainter(this.Radius_1, this.Radius_2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle1 = Paint()..color = bgColor;

    Paint circle2 = Paint()..color = colorbody;

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width * Radius_1, circle1);

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width * Radius_2, circle2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
