import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirte_university/custom/Menu/side_menu.dart';
import 'package:sirte_university/custom/home_screen/widget/home.dart';
import 'package:sirte_university/custom/home_screen/custom/logo_in_app_bar.dart';
import 'package:sirte_university/custom/home_screen/widget/map/home.dart';
import 'package:sirte_university/custom/home_screen/widget/none_login/noun_login.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';
import 'package:sirte_university/vars/text.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

double? oneTime;

class _HomeScreenState extends State<HomeScreen> {
  int _index = 3;

  final List<Widget> _pagesWidget = <Widget>[
    const NoneLogIn(),
    const HomeMap(),
    const NoneLogIn(),
    const Home(),
  ];

  double dx = 0;
  double ry = 0;

  Future memorisOne() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double decimal = prefs.getDouble('one')!;
    oneTime = decimal;
  }

  bool isDrawerOpen = false;
  double dxmenu = SizeConfig.screenWidth! * 0.3;

  final GlobalKey _barHome = GlobalKey();
  final GlobalKey _barChat = GlobalKey();
  final GlobalKey _barmap = GlobalKey();
  final GlobalKey _barData = GlobalKey();
  final GlobalKey _imgDarwer = GlobalKey();

  @override
  void initState() {
    memorisOne();
    if (oneTime == 0.0) {
      _createtutorial();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: bgColor),
        backgroundColor: colorwhite,
        //
        actions: [
          Text(
            universityOfSirte,
            style: TextStyle(
              fontSize: 32,
              color: bgColor,
              fontFamily: 'Katibeh',
            ),
          ),
        ],
        //
        leading: Builder(
          builder: (context) => IconButton(
            icon: const LogoInAppBar(),
            key: _imgDarwer,
            onPressed: () {
              setState(() {
                if (isDrawerOpen) {
                  dx = 0;
                  ry = 0;
                  isDrawerOpen = true;
                } else {
                  dx = -300.0;
                  ry = 3.14 / -4;
                  isDrawerOpen = false;
                }
                isDrawerOpen = !isDrawerOpen;
                oneTime = 1.0;
              });
              memorisOnecelck() async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setDouble('one', oneTime!);
              }

              setState(() {
                memorisOnecelck();
              });
            },
          ),
        ),
      ),
      body: isDrawerOpen == false
          ? Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(0),
              child: Transform.translate(
                offset: const Offset(0, 0),
                child: _pagesWidget.elementAt(_index),
              ),
            )
          : Stack(
              children: [
                Transform.translate(
                  offset: Offset(dxmenu, 0),
                  child: const SideMenu(),
                ),
                TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: ry),
                  duration: const Duration(milliseconds: 600),
                  builder: (context, tweenr, child) {
                    return TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: dx),
                      duration: const Duration(milliseconds: 600),
                      builder: (context, tweendx, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(tweenr),
                          child: Transform.translate(
                            offset: Offset(tweendx, 0),
                            child: _pagesWidget.elementAt(_index),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
            icon: Icon(
              Icons.person_off_outlined,
              color: colorbody,
              key: _barData,
            ),
          ),
          TabItem(
            icon: Icon(
              Icons.location_on_outlined,
              color: colorbody,
              key: _barmap,
            ),
          ),
          TabItem(
            icon: Icon(
              Icons.chat,
              color: colorbody,
              key: _barChat,
            ),
          ),
          TabItem(
            icon: Icon(
              Icons.home,
              color: colorbody,
              key: _barHome,
            ),
          ),
        ],
        initialActiveIndex: _index,
        onTap: _indexOnTap,
        backgroundColor: colorwhite,
        activeColor: bgColor,
      ),
    );
  }

  void _indexOnTap(int index) {
    setState(() {
      _index = index;
    });
  }

  void _createtutorial() {
    final targets = [
      TargetFocus(
        identify: "_barHome",
        keyTarget: _barHome,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "انت في الصفحه الرئيسيه",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "_barChat",
        keyTarget: _barChat,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "بعد تسجيل الدخول انقر على الايقونه لعرض اخر الاخبار",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "_barmap",
        keyTarget: _barmap,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "انقر على الايقونه لعرض خريطه الجامعه",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "_barData",
        keyTarget: _barData,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "بعد تسجيل الدخول انقر على الايقونه لعرض بياناتك",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "_imgDarwer",
        keyTarget: _imgDarwer,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "انقر على الشعار لفتح القائمه الجانبيه",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ];

    final tutorial = TutorialCoachMark(targets: targets);

    Future.delayed(const Duration(seconds: 1), () {
      tutorial.show(context: context);
    });
  }
}
