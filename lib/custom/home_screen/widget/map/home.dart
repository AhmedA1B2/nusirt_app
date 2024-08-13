import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sirte_university/custom/check_internet/check/checknit.dart';
import 'package:sirte_university/custom/check_internet/lodign/loding.dart';
import 'package:sirte_university/custom/check_internet/ui_nonit/no_nit.dart';
import 'package:sirte_university/custom/home_screen/widget/map/custom/app_bar_textbutton.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});
  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  final MapController _mapController = MapController();
  void _moveAndZoomMap(double lat, double lng, double zoom) {
    _mapController.move(LatLng(lat, lng), zoom);
  }

  double x = 0;
  bool isLoding = false;
  bool net = true;

  customBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: bgColor),
        ),
        child: IconButton(
            color: bgColor,
            onPressed: () {
              x = 0;
              setState(() {});
            },
            icon: const Icon(
              Icons.arrow_right_alt,
            )),
      ),
    );
  }

  college() {
    return Container(
      decoration: const BoxDecoration(),
      height: SizeConfig.screenHeight! * 0.1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          const SizedBox(
            width: 10,
          ),
          customBackButton(),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17658, 16.602220, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "كلية العلوم",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.1755, 16.6018, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "كلية الاداب والقانون",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17727, 16.60158, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "كلية الزراعة",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17781, 16.60348, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "كلية تقنية المعلومات",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.176643, 16.608733, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "كلية الاقتصاد",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17870, 16.6073, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "كلية الهندسة",
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  mrafq() {
    return Container(
      decoration: const BoxDecoration(),
      height: SizeConfig.screenHeight! * 0.1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          const SizedBox(
            width: 10,
          ),
          customBackButton(),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17520, 16.60140, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "بوابة جامعة سرت",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17536, 16.6024, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "القرطاسيات",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17494, 16.60231, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "مسجد الجامعة",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.176068, 16.6034057, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "مكتب ادارة الجامعة",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17836, 16.60804, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "المكتبة",
              )),
          TextButton(
            onPressed: () {
              _moveAndZoomMap(31.17562, 16.60291, 20);
              setState(() {});
            },
            child: const AppBarTextButton(
              textAppBar: "مكتب المسجل العام",
            ),
          ),
          TextButton(
            onPressed: () {
              _moveAndZoomMap(31.1772588, 16.6083278, 20);
              setState(() {});
            },
            child: const AppBarTextButton(
              textAppBar: "معامل كلية العلوم",
            ),
          ),
          TextButton(
            onPressed: () {
              _moveAndZoomMap(31.1777781, 16.606896, 20);
              setState(() {});
            },
            child: const AppBarTextButton(
              textAppBar: "معامل كلية الهندسة",
            ),
          ),
          TextButton(
            onPressed: () {
              _moveAndZoomMap(31.17682227, 16.60152857, 20);
              setState(() {});
            },
            child: const AppBarTextButton(
              textAppBar: "مقهى العلوم",
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              _moveAndZoomMap(31.176455, 16.6053569, 20);
              setState(() {});
            },
            child: const AppBarTextButton(
              textAppBar: "مقهى الاقتصاد",
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              _moveAndZoomMap(31.177908, 16.6065119, 20);
              setState(() {});
            },
            child: const AppBarTextButton(
              textAppBar: "مقهى الهندسة",
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  qandm() {
    return Container(
      decoration: const BoxDecoration(),
      height: SizeConfig.screenHeight! * 0.1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          const SizedBox(
            width: 10,
          ),
          customBackButton(),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.1759397, 16.601824, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "مدرج العدالة",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.17525, 16.60243, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "قاعة النشاط",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.1758891, 16.602695, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "مجمع القاعات",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.1764, 16.60427, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "المدرجات",
              )),
          TextButton(
              onPressed: () {
                _moveAndZoomMap(31.177623, 16.605474, 20);
                setState(() {});
              },
              child: const AppBarTextButton(
                textAppBar: "قاعات الاقتصاد",
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  opshns() {
    if (x == 0) {
      return Container(
        decoration: const BoxDecoration(),
        height: SizeConfig.screenHeight! * 0.1,
        child: ListView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          children: [
            const SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: () {
                  x = 1;
                  setState(() {});
                },
                child: const AppBarTextButton(
                  textAppBar: "الكليات",
                )),
            TextButton(
                onPressed: () {
                  x = 2;
                  setState(() {});
                },
                child: const AppBarTextButton(
                  textAppBar: "مرافق الجامعه",
                )),
            TextButton(
                onPressed: () {
                  x = 3;
                  setState(() {});
                },
                child: const AppBarTextButton(
                  textAppBar: "القاعات والمدرجات",
                )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  markerLayercollege() {
    if (x == 1) {
      return MarkerLayer(
        markers: [
          Marker(
            point: const LatLng(31.1757, 16.6017),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/c5.png")),
            width: 50,
            height: 50,
          ),
          Marker(
            point: const LatLng(31.1755, 16.6018),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/c10.png")),
            width: 50,
            height: 50,
          ),
          Marker(
            point: const LatLng(31.17658, 16.602220),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/c11.png")),
            width: 50,
            height: 50,
          ),
          Marker(
            point: const LatLng(31.17781, 16.60348),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/it.png")),
            width: 50,
            height: 50,
          ),
          Marker(
            point: const LatLng(31.17727, 16.60158),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/c6.png")),
            width: 50,
            height: 50,
          ),
          Marker(
            point: const LatLng(31.176643, 16.608733),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/c7.png")),
            width: 50,
            height: 50,
          ),
          Marker(
            point: const LatLng(31.17870, 16.6073),
            child: GestureDetector(
                onTap: () {}, child: Image.asset("image/in/c22.png")),
            width: 40,
            height: 40,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  markerLayerqandm() {
    if (x == 3) {
      return MarkerLayer(markers: [
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.1759397, 16.601824),
          child:
              GestureDetector(onTap: () {}, child: const Text("مدرج العدالة")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.17525, 16.60243),
          child:
              GestureDetector(onTap: () {}, child: const Text("قاعة النشاط")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.1758891, 16.602695),
          child:
              GestureDetector(onTap: () {}, child: const Text("مجمع القاعات")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.17624, 16.604212),
          child: GestureDetector(
              onTap: () {}, child: const Text("مدرج مصباح العروي")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.17631, 16.604412),
          child: GestureDetector(
              onTap: () {}, child: const Text("مدرج خليفة بالناصر ")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.176411, 16.604312),
          child: GestureDetector(
              onTap: () {}, child: const Text("مدرج بيت الحكمة")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.177623, 16.605474),
          child: GestureDetector(
              onTap: () {}, child: const Text("قاعات الاقتصاد")),
        ),
      ]);
    } else {
      return const SizedBox();
    }
  }

  markerLayermrafq() {
    if (x == 2) {
      return MarkerLayer(markers: [
        Marker(
          point: const LatLng(31.17520484097193, 16.601400783962333),
          child: GestureDetector(
              onTap: () {}, child: Image.asset("image/in/su-su.png")),
          width: 50,
          height: 50,
        ),
        Marker(
          point: const LatLng(31.1754, 16.6024),
          child: GestureDetector(
              onTap: () {}, child: Image.asset("image/in/mktbat.png")),
          width: 40,
          height: 40,
        ),
        Marker(
          width: 40,
          height: 40,
          point: const LatLng(31.17836, 16.60804),
          child: GestureDetector(
              onTap: () {}, child: Image.asset("image/in/mk.png")),
        ),
        Marker(
          width: 40,
          height: 40,
          point: const LatLng(31.1772588, 16.6083278),
          child: GestureDetector(
              onTap: () {}, child: Image.asset("image/in/m3.png")),
        ),
        Marker(
          width: 40,
          height: 40,
          point: const LatLng(31.1777781, 16.606896),
          child: GestureDetector(
              onTap: () {}, child: Image.asset("image/in/m3c22.png")),
        ),
        Marker(
          width: 200,
          height: 40,
          point: const LatLng(31.176068, 16.6034057),
          child: GestureDetector(
              onTap: () {}, child: const Text("مكتب ادارة الجامعة")),
        ),
      ]);
    } else {
      return const SizedBox();
    }
  }

  show() {
    if (x == 1) {
      return college();
    }
    if (x == 2) {
      return mrafq();
    }
    if (x == 3) {
      return qandm();
    }
    return const SizedBox();
  }

  // ignore: prefer_typing_uninitialized_variables
  var check;
  intialdata() async {
    isLoding = true;
    setState(() {});
    check = await checkInternet();
    isLoding = false;
    net = check;
    setState(() {});
  }

  @override
  void initState() {
    intialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoding == true
        ? const Loding()
        : net == false
            ? MaterialButton(
                padding: const EdgeInsets.all(0),
                color: nuneColor,
                onPressed: () {
                  intialdata();
                },
                child: const NoNit(),
              )
            : Scaffold(
                body: Stack(
                  children: [
                    FlutterMap(
                      mapController: _mapController,
                      options: const MapOptions(
                        initialCenter: LatLng(31.1752, 16.6014),
                        initialZoom: 18,
                        interactionOptions: InteractionOptions(
                          flags: ~InteractiveFlag.doubleTapZoom,
                        ),
                      ),
                      children: [
                        openStreetMapTileLater,
                        markerLayercollege(),
                        markerLayerqandm(),
                        markerLayermrafq(),
                        opshns(),
                        show(),
                      ],
                    ),
                    const Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              '© OpenStreetMap contributors',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
              );
  }
}

TileLayer get openStreetMapTileLater => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );


//