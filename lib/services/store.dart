import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:traffic/constans.dart';
import 'package:traffic/models/car_info.dart';
import 'package:flutter/material.dart';

class Store {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addNewCarInfo(CarInfo carInfo) {
    firebaseFirestore.collection(carDataInfo).add({
      carNumber: carInfo.carNumber,
      ownerName: carInfo.ownerName,
      trafficViolation: carInfo.trafficViolation,
      imageCarUrl: carInfo.imageCarUrl,
      ownerMail: carInfo.ownerMail
    });
  }

  Stream<QuerySnapshot> loadCarInfo() {
    return firebaseFirestore.collection(carDataInfo).snapshots();
  }
}
