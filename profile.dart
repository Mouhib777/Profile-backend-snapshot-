//import 'package:bil/Widget/button_widget.dart';
//import 'package:bil/Widget/profile_widget.dart';
import 'package:bil/constant/constants.dart';
import 'package:bil/model/user.dart';
import 'package:bil/screens/home/notification.dart';
import 'package:bil/screens/profile/EditProfilePage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:bil/utils/user_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:bil/Widget/appbar.dart';
//import 'package:bil/Widget/numbers_widget.dart';
import 'package:bil/Service/StorageService.dart';
import 'package:bil/Service/auth.dart';
import 'package:bil/Service/DataBase.dart';

class profilescreen extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;

  const profilescreen(
      {Key? key, required this.currentUserId, required this.visitedUserId})
      : super(key: key);

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  // const profilescreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body: FutureBuilder(
            future: usersRef.doc(widget.visitedUserId).get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(BIL_Color),
                  ),
                );
              }
              Usermodel usermodel = Usermodel.fromDocument(
                snapshot.data,
              );
              return ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          //color: BIL_Color,

                          //  ? null
                          // : DecorationImage(
                          //  fit: BoxFit.cover,
                          // image: NetworkImage(usermodel.coverImage),
                          image: DecorationImage(
                              image: AssetImage('assets/images/bilCover.jpeg'),
                              fit: BoxFit.cover)),
                      child: Row(
                        children: [
                          SizedBox.shrink(),
                        ],
                      ),
                    ),
                    SizedBox(),
                    Container(
                        transform: Matrix4.translationValues(80.0, -40.0, 0.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                              usermodel.profilePicture.isEmpty
                                                  ? null
                                                  : NetworkImage(
                                                      usermodel.profilePicture),
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 40,
                                    child: Container(
                                        transform: Matrix4.translationValues(
                                            -78.0, 30.0, 0.0),
                                        child: Text(
                                          usermodel.name,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 120,
                                    child: Container(
                                        alignment: Alignment.center,
                                        transform: Matrix4.translationValues(
                                            -180.0, 45.0, 0.0),
                                        child: Text(
                                          'About  ',
                                          style: TextStyle(
                                              color: BIL_Color,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 80,
                                    width: 300,
                                    child: Container(
                                        alignment: Alignment.topCenter,
                                        transform: Matrix4.translationValues(
                                            -80.0, 40.0, 0.0),
                                        padding: EdgeInsets.only(top: 22),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white12,
                                          border: Border.all(
                                              color: BIL_Color, width: 1.5),
                                        ),
                                        child: Text(
                                          usermodel.bio,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                edit_profile_page(
                                                    user: usermodel),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          transform: Matrix4.translationValues(
                                              -10.0, 20.0, 0.0),
                                          width: 110,
                                          height: 45,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            color: Colors.blue[50],
                                            border:
                                                Border.all(color: BIL_Color),
                                          ),
                                          child: Center(
                                              child: Text('Edit Profile',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: BIL_Color,
                                                    fontWeight: FontWeight.bold,
                                                  )))))
                                ],
                              )
                            ]))
                  ]);
            }));
  }
}
