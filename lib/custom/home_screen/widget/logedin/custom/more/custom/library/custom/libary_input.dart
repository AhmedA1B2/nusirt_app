import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class LibaryInput extends StatefulWidget {
  const LibaryInput({super.key});

  @override
  State<LibaryInput> createState() => _LibaryInputState();
}

class _LibaryInputState extends State<LibaryInput> {
  TextEditingController textEditingController = TextEditingController();
  Crud crud = Crud();
  bool isLoading = false;

  add() async {
    if (textEditingController.text != "") {
      isLoading = true;
      setState(() {});
      if (sharedPref.getString("slogin").toString() == "1") {
        var response = await crud.postRequest(linkaddhgz, {
          "name": sharedPref.getString("name").toString(),
          "num": sharedPref.getString("num").toString(),
          "college": sharedPref.getString("college").toString(),
          "book": textEditingController.text,
          "id_add": sharedPref.getString("id").toString(),
          "date": "${DateTime.now().month}/${DateTime.now().day}"
        });
        isLoading = false;
        setState(() {});
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
          'libary',
          (route) => false,
        );
        if (response['status' == "success"]) {}
      } else {
        var response = await crud.postRequest(linkaddhgz, {
          "name": sharedPref.getString("name").toString(),
          "num": sharedPref.getString("emil").toString(),
          "college": sharedPref.getString("college").toString(),
          "book": textEditingController.text,
          "id_add": sharedPref.getString("id").toString(),
          "date": "${DateTime.now().month}/${DateTime.now().day}"
        });
        isLoading = false;
        setState(() {});
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
          'libary',
          (route) => false,
        );
        if (response['status' == "success"]) {}
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'info',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: SizeConfig.screenHeight! * 0.18,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                        hintText: "أسم الكتاب",
                        con: textEditingController,
                        fillColor: colorbody),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    add();
                  },
                  icon: Icon(
                    Icons.send_rounded,
                    color: colorwhite,
                    size: 32,
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
  }
}
