import 'package:flutter/material.dart';
import 'package:traffic/screens/adminscreens/admin_login_screen.dart';
import 'package:traffic/screens/userscreens/login_screen.dart';

class HomePage extends StatelessWidget {
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("TRAFFIC"),
      ),
      body: Stack(
        children: [
          Image(
            height: h,
            width: w,
            fit: BoxFit.fill,
            image: AssetImage('images/traffic1.jpg'),
          ),
          Opacity(
            opacity: .6,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 200, 0, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginSCreen.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: w * .8,
                  height: h * .15,
                  child: Center(
                    child: Text(
                      "I'm A User",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: Opacity(
              opacity: .6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 150, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AdminLoginScreen.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    width: w * .8,
                    height: h * .15,
                    child: Center(
                      child: Text(
                        "I'm An Admin",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
