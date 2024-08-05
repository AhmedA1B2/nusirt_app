import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sirte_university/api/crud.dart';
import 'package:sirte_university/api/links.dart';
import 'package:sirte_university/custom/login_screen/widget_for_login/txet_form_field.dart';
import 'package:sirte_university/main.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class LibaryEidt extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final stData;
  const LibaryEidt({super.key, this.stData});

  @override
  State<LibaryEidt> createState() => _LibaryInputState();
}

class _LibaryInputState extends State<LibaryEidt> {
  TextEditingController textEditingController = TextEditingController();
  Crud crud = Crud();
  bool isLoading = false;

  eidt() async {
    sharedPref.setString("idbook", widget.stData["id"].toString());
    if (textEditingController.text != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkeidtehgz, {
        "book": textEditingController.text,
        "id": sharedPref.getString("idbook").toString()
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
  void initState() {
    textEditingController.text = widget.stData["book"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Column(
              children: [
                const Expanded(child: SizedBox()),
                Container(
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
                          eidt();
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
                ),
              ],
            ),
          );
  }
}
