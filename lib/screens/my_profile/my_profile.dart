import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/auth/sign_in.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/my_order/my_order.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyProfile extends StatefulWidget {
  UserProvider userProvider;
  MyProfile({this.userProvider});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile(
      {IconData icon, String title, String data, VoidCallback tap}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          onTap: tap,
          leading: Icon(icon),
          title: Text(title),
          // trailing: Icon(Icons.arrow_forward_ios),
          trailing: Text(data),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    FirebaseAuth fireabase = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: DrawerSide(
        userProvider: widget.userProvider,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 591,
                width: double.infinity,
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData.userName,
                                    style: TextStyle(
                                        fontSize: 14, color: textColor2),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    userData.userEmail,
                                    style: TextStyle(
                                        fontSize: 14, color: textColor2),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // listTile(
                    //     icon: Icons.exit_to_app_outlined,
                    //     title: "Log Out",
                    //     tap: () async {
                    //       print("logout is tapped");
                    //       await GoogleSignIn().signOut();
                    //       await fireabase.signOut();
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) {
                    //         return SignIn();
                    //       }));
                    //     }),
                    listTile(
                        title: "Phone number",
                        tap: () async {},
                        data: "3423423423423"),
                    listTile(
                      icon: Icons.exit_to_app_outlined,
                      title: "Address",
                      tap: () async {},
                      data: "shibgonj senpara",
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    userData.userImage ??
                        "https://s3.envato.com/files/328957910/vegi_thumb.png",
                  ),
                  radius: 45,
                  backgroundColor: scaffoldBackgroundColor),
            ),
          )
        ],
      ),
    );
  }
}








          // Column(
          //   children: [
          //     Container(
          //       height: 100,
          //       color: primaryColor,
          //     ),
          //     Container(
          //       height: 591,
          //       width: double.infinity,
          //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //       decoration: BoxDecoration(
          //         color: scaffoldBackgroundColor,
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(30),
          //           topRight: Radius.circular(30),
          //         ),
          //       ),
          //       child: ListView(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               Container(
          //                 width: 250,
          //                 height: 80,
                         
          //                 padding: EdgeInsets.only(left: 20),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: [
          //                     Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Text(
          //                           userData.userName,
          //                           style: TextStyle(
          //                               fontSize: 14,
                                       
          //                               color: textColor2),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Text(userData.userEmail, style: TextStyle(
          //                               fontSize: 14,
                                      
          //                               color: textColor2),),
          //                       ],
          //                     ),
                             
          //                     // CircleAvatar(
          //                     //   radius: 15,
          //                     //   backgroundColor: primaryColor,
          //                     //   child: CircleAvatar(
          //                     //     radius: 12,
          //                     //     child: Icon(
          //                     //       Icons.edit,
          //                     //       color: primaryColor,
          //                     //     ),
          //                     //     backgroundColor: scaffoldBackgroundColor,
          //                     //   ),
          //                     // )
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //           //   listTile(icon: Icons.shop_outlined, title: "My Orders" , tap:(){
          //           //      Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //           //   return MyOrder();
          //           // }));
          //           //   }),
          //           // listTile(
          //           //     icon: Icons.location_on_outlined,
          //           //     title: "My Delivery Address"),
          //           // listTile(
          //           //     icon: Icons.person_outline, title: "Refer A Friends"),
          //           // listTile(
          //           //     icon: Icons.file_copy_outlined,
          //           //     title: "Terms & Conditions"),
          //           // listTile(
          //           //     icon: Icons.policy_outlined, title: "Privacy Policy"),
          //           // listTile(icon: Icons.add_chart, title: "About"),
          //           listTile(
          //               icon: Icons.exit_to_app_outlined,
          //               title: "Log Out",
          //               tap: () async {
          //                 print("logout is tapped");
          //                 await GoogleSignIn().signOut();
          //                 await fireabase.signOut();
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context) {
          //                   return SignIn();
          //                 }));
          //               }),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 40, left: 30),
          //   child: CircleAvatar(
          //     radius: 50,
          //     backgroundColor: primaryColor,
          //     child: CircleAvatar(
          //         backgroundImage: NetworkImage(
          //           userData.userImage ??
          //               "https://s3.envato.com/files/328957910/vegi_thumb.png",
          //         ),
          //         radius: 45,
          //         backgroundColor: scaffoldBackgroundColor),
          //   ),
          // )
        
