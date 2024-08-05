
import 'package:flutter/material.dart';

import 'package:sirte_university/vars/size.dart';

class ButtonForm extends StatefulWidget {
  const ButtonForm({
    super.key,
  });

  @override
  State<ButtonForm> createState() => _ButtonFormState();
}

TextEditingController nums = TextEditingController();
TextEditingController passs = TextEditingController();

class _ButtonFormState extends State<ButtonForm> {
//
  List data = [];

  saechData(){
   
  }

  @override
  void initState() {
    saechData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
        onPressed: (){
          
        },
        child: const Text(
          'دخول',
        ));
  }
}
