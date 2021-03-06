import 'package:cs310_footwear_project/routes/login_view.dart';
import 'package:cs310_footwear_project/services/analytics.dart';
import 'package:cs310_footwear_project/services/auth.dart';
import 'package:cs310_footwear_project/services/db.dart';
import 'package:cs310_footwear_project/ui/navigation_bar.dart';
import 'package:cs310_footwear_project/utils/color.dart';
import 'package:cs310_footwear_project/utils/dimension.dart';
import 'package:cs310_footwear_project/utils/styles.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  AuthService auth = AuthService();
  DBService db = DBService();

  @override
  Widget build(BuildContext context) {
    print("ProfileView build is called.");
    final user = Provider.of<User?>(context);
    FirebaseAnalytics analytics = widget.analytics;
    FirebaseAnalyticsObserver observer = widget.observer;

    if (user != null) {

      setCurrentScreen(widget.analytics, "Profile View", "profileView");

      return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackgroundColor,
          elevation: Dimen.appBarElevation,
          title: Text(
            "Profile",
            style: kAppBarTitleTextStyle,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, Dimen.parentMargin, 0, Dimen.parentMargin),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const Divider(thickness: Dimen.divider_1_5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: const [
                            CircleAvatar(
                              radius: 35,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "LeBron James",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "lebrbjames",
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/editProfile');
                          },
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Row(
                        children: const [
                          Text(
                            "Rating:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          //TODO: find star rating bar
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                        ],
                      )
                    ]),
                  ],
                ),
                const Divider(thickness: Dimen.divider_1_5,),
                const SizedBox(height: Dimen.sizedBox_30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/orders');
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                      ),
                      label: Row(
                        children: const [
                          SizedBox(width: Dimen.sizedBox_30),
                          Text(
                            "My Orders",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        //backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    const Divider(thickness: Dimen.divider_1_5,),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/bookmarks');
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.black,
                      ),
                      label: Row(
                        children: const [
                          SizedBox(width: Dimen.sizedBox_30),
                          Text(
                            "My Bookmarks",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        //backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    const Divider(thickness: Dimen.divider_1_5,),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/comments');
                      },
                      icon: const Icon(Icons.comment, color: Colors.black),
                      label: Row(
                        children: const [
                          SizedBox(width: Dimen.sizedBox_30),
                          Text(
                            "My Comments",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        //backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    const Divider(thickness: Dimen.divider_1_5,),
                  ],
                ),
                const SizedBox(height: Dimen.sizedBox_90),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/onSale');
                  },
                  icon: const Icon(Icons.attach_money, color: Colors.black),
                  label: Row(
                    children: const [
                      SizedBox(width: Dimen.sizedBox_30),
                      Text(
                        "My Products",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    //backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                const Divider(thickness: Dimen.divider_1_5,),
                const SizedBox(height: Dimen.sizedBox_90),
                OutlinedButton.icon(
                  icon: const Icon(Icons.logout, color: Colors.redAccent),
                  onPressed: () {
                    auth.signOut();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Logging out')));
                  },
                  label: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    //backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(index: 3,),
      );
    }
    else {
      return LoginView(observer: observer, analytics: analytics,);
    }
  }
}
