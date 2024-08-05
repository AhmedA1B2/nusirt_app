import 'package:flutter/material.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.inputType,
    this.onChanged,
    this.onSaved,
    required this.con, required this.fillColor,
  });

  final String hintText;
  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final TextEditingController con;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.defaultSize! * 5.8,
      child: TextFormField(
        controller: con,
        textAlign: TextAlign.end,
        //########## vars #######//
        keyboardType: inputType,
        onChanged: onChanged,
        onSaved: onSaved,

        decoration: InputDecoration(
          //########focuse########//
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: colorbody)),
          // ####### Hint ####### //
          hintText: hintText,
          hintStyle:  TextStyle(
            color: colorwhite,
            fontWeight: FontWeight.bold,
          ),
          // ######## body ####### //
          filled: true,
          fillColor: fillColor,
          focusColor: colorwhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                color: Colors.black, width: 2.0, style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}
