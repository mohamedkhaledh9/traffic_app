import 'package:flutter/material.dart';
import 'package:traffic/screens/adminscreens/add_car_info_screen.dart';
import 'package:traffic/services/auh.dart';
import 'package:traffic/widgets/custom_text_field.dart';

class AdminLoginScreen extends StatelessWidget {
  Auth _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email, _password;
  static String id = "AdminLoginScreen";

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
              padding: EdgeInsets.fromLTRB(10, 230, 10, 0),
              child: CustomTextField(
                hint: "Enter User Name",
                onClick: (value) {
                  _email = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 320, 10, 0),
              child: CustomTextField(
                onClick: (value) {
                  _password = value;
                },
                hint: "Enter Your Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: Builder(
                    builder: (context) => RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.black,
                      onPressed: () async {
                        try {
                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                            await _auth.signIn(_email, _password);
                            Navigator.pushNamed(context, AddCarInfo.id);
                          } else {
                            debugPrint('failed sign in');
                          }
                        } catch (e) {
                          return Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                e.toString(),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
