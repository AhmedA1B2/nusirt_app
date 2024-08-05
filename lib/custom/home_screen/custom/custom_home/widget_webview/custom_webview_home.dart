import 'package:flutter/material.dart';
import 'package:sirte_university/custom/check_internet/check/checknit.dart';
import 'package:sirte_university/custom/check_internet/ui_nonit/no_nit.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewHome extends StatefulWidget {
  const WebViewHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebViewTestState();
  }
}

class _WebViewTestState extends State<WebViewHome> {
  late final WebViewController _controller;

  String filePath = 'assets/index.html';

  bool isLoding = false;
  bool net = true;
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
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    _loadHtmlFromAssets();
    return isLoding == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
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
                appBar: AppBar(
                  backgroundColor: bgColor,
                  foregroundColor: colorwhite,
                ),
                body: WebViewWidget(controller: _controller),
              );
  }

  _loadHtmlFromAssets() async {
    _controller.loadRequest(Uri.parse('https://su.edu.ly/arabic/'));
  }
}
