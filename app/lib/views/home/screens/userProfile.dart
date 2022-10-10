import 'package:app/utils/user_preference.dart';
import 'package:app/views/home/widgets/appbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/User-Profile.dart';
import '../widgets/profile_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user= UserPreferance.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imgPath: user.imgPath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
        ],
        ),
    );
  }
}

Widget buildName(User_Profile user)=>Column(
  children: [
    Text(user.name,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
    const SizedBox(height:4),
    Text(user.email,
    style: TextStyle(fontSize:16),
    ),
  ],);