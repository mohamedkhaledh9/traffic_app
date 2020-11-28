import 'package:flutter/material.dart';
import 'package:traffic/constans.dart';
import 'package:traffic/models/car_info.dart';
import 'package:traffic/services/auh.dart';
import 'package:traffic/services/store.dart';
import 'package:traffic/widgets/custom_text_field.dart';

class AddCarInfo extends StatelessWidget {
  Auth _auth = Auth();
  Store _store = Store();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = "AddCarInfo";
  String _email, _password, _imagePath, _numberOfViolations, _ownerName;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("TRAFFIC APP"),
      ),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _globalKey,
        child: Stack(
          children: [
            Image(
              image: AssetImage('images/traffic1.jpg'),
              height: h,
              width: w,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: CustomTextField(
                hint: "Enter The Car Owner Name",
                onClick: (value) {
                  _ownerName = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
              child: CustomTextField(
                hint: "Enter The Car Owner Email",
                onClick: (value) {
                  _email = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: CustomTextField(
                hint: "Enter The Car Number",
                onClick: (value) {
                  _password = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 280, 10, 0),
              child: CustomTextField(
                hint: "Enter The Number Of Traffic Violation",
                onClick: (value) {
                  _numberOfViolations = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 360, 10, 0),
              child: CustomTextField(
                hint: "Enter The Car Picture Path",
                onClick: (value) {
                  _imagePath = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 180, 10, 0),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: Builder(
                    builder: (context) => RaisedButton(
                      onPressed: () async {
                        try {
                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                            final userData =
                                await _auth.signUp(_email, _password);
                            _store.addNewCarInfo(
                              CarInfo(
                                  ownerName: _ownerName,
                                  carNumber: _password,
                                  trafficViolation: _numberOfViolations,
                                  imageCarUrl: _imagePath,
                                  ownerMail: _email),
                            );
                            _globalKey.currentState.reset();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Item Added")),
                            );
                          }
                        } catch (e) {
                          return Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('failed adding !!!'),
                            ),
                          );
                        }
                        // if (_globalKey.currentState.validate()) {
                        //   _globalKey.currentState.save();
                        //   final userData =
                        //       await _auth.signUp(_email, _password);
                        //   _store.addNewCarInfo(
                        //     CarInfo(
                        //         ownerName: _email,
                        //         carNumber: _password,
                        //         trafficViolation: _numberOfViolations,
                        //         imageCarUrl: _imagePath),
                        //   );
                        //   _globalKey.currentState.reset();
                        // }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.black,
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
