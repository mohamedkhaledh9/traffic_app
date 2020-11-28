import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traffic/constans.dart';
import 'package:traffic/models/car_info.dart';
import 'package:traffic/services/store.dart';
import "package:firebase_auth/firebase_auth.dart" as auth;

auth.User loggedInUser;

class OwnerCarScreen extends StatefulWidget {
  static String id = "OwnerCarScreen";

  @override
  _OwnerCarScreenState createState() => _OwnerCarScreenState();
}

class _OwnerCarScreenState extends State<OwnerCarScreen> {
  Store _store = Store();
  final _auth = auth.FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint(_loggedInUser.email);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("TRRAFIC APP"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadCarInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CarInfo> carInfo = [];
            for (var car in snapshot.data.docs) {
              carInfo.add(
                CarInfo(
                    ownerName: car.data()[ownerName],
                    carNumber: car.data()[carNumber],
                    ownerMail: car.data()[ownerMail],
                    trafficViolation: car.data()[trafficViolation],
                    imageCarUrl: car.data()[imageCarUrl],
                    id: car.data()[ownerId]),
              );
            }
            return ListView.builder(
              itemCount: carInfo.length,
              itemBuilder: (context, index) {
                if (carInfo[index].ownerMail == loggedInUser.email) {
                  // if (carInfo.isNotEmpty) {
                  return Stack(
                    children: [
                      Image(
                        image: AssetImage('images/traffic1.jpg'),
                        fit: BoxFit.fill,
                        height: h,
                        width: w,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                        child: Opacity(
                          opacity: .7,
                          child: Container(
                            height: h * .1,
                            width: w * .9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey),
                            child: Center(
                              child: Text(
                                " Owner Name : ${carInfo[index].ownerName}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
                        child: Opacity(
                          opacity: .7,
                          child: Container(
                            height: h * .1,
                            width: w * .9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey),
                            child: Center(
                              child: Text(
                                " Owner Email : ${carInfo[index].ownerMail}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 250, 10, 0),
                        child: Opacity(
                          opacity: .7,
                          child: Container(
                            height: h * .1,
                            width: w * .9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey),
                            child: Center(
                              child: Text(
                                " Car Number Is : ${carInfo[index].carNumber}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 350, 10, 0),
                        child: Opacity(
                          opacity: .7,
                          child: Container(
                            height: h * .1,
                            width: w * .9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey),
                            child: Center(
                              child: Text(
                                " Number Of Traffic Violation Is : ${carInfo[index].trafficViolation}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 450),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
                            child: Image(
                              height: h * .3,
                              width: w * .8,
                              image: AssetImage(carInfo[index].imageCarUrl),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text("");
                }
              },
            );
          } else {
            return Center(
              child: Text("Loading ...."),
            );
          }
        },
      ),
    );
  }
}
