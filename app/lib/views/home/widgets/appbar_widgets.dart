import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions:[
      IconButton(onPressed: (){},
       icon: Icon(CupertinoIcons.moon_stars))
    ]
  );
}