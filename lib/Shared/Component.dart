
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget defaultButtom({
  required background,
  required Width,
  double radious = 10.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radious),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String label,
  required validate,
  ontap,
  onchanged,
  onsumited ,
  required IconData prefix,
  IconData? suffix,
  suffixPressed,
  bool isPassword = false,
}) =>
    TextFormField(
      onFieldSubmitted: onsumited,
      controller: controller,
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
      validator: validate,
      onTap: ontap,
      onChanged: onchanged,
    );




Widget separatorBuilderItem() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.brown,
        height: 5.0,
      ),
    );

