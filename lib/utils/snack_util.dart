import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class SnackUtil {
  static void showSnackBar(BuildContext context, String message, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  static Future<void> share() async {
    await FlutterShare.share(
        title: 'What Zodiac Sign Is This?',
        text:
            'How well do you know your Zodiac signs? :joy: Laugh your a** off and learn more about each Zodiac sign with "What Zodiac Sign is This? Let\'s download this app and enjoy.',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.appwiththat.whatsignisthis',
        chooserTitle: 'Share to:');
  }

  static Future openUrl({required Uri uri}) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  static void showToast({required FToast ftoast, required String message, required IconData icon, required Color color}) {
    Widget toast = Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'quizfontm',
                fontSize: 18.0,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
      ),
    );

    ftoast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
