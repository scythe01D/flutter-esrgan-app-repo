//BACKUP OF HOME.DART _________________________________

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esrgan_app/emailSignUpPage.dart';
import 'package:flutter_esrgan_app/widgets/google_sign_in_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
//import 'google_sign_in.dart.WWWWWWWWWWW.txt';
import 'authentication/authentication.dart';
import 'widgets/scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler()..init(context);
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //DEBUG Text("AAAAAAAAAAA" + scaler.getHeight(100).toString()),
          Container(
              height: scaler.getHeight(30),
              child: Image.asset('assets/images/esrganFlutterLogo.png')),
          Text(
            "ESRGAN",
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.blue,
                  letterSpacing: .5,
                  fontSize: scaler.getHeight(2.5),
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: scaler.getHeight(7),
          ),
          //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          //   child: ElevatedButton.icon(
          //       onPressed: () {
          //         // final provider =
          //         //     Provider.of<GoogleSignInProvider>(context, listen: false);
          //         // provider.googleLogin();
          //       },
          //       style: ElevatedButton.styleFrom(
          //           shape: new RoundedRectangleBorder(
          //             borderRadius: new BorderRadius.circular(30.0),
          //           ),
          //           primary: Colors.white,
          //           onPrimary: Colors.blue[500],
          //           minimumSize: Size(double.infinity, 50)),
          //       icon: FaIcon(
          //         FontAwesomeIcons.google,
          //       ),
          //       label: Text(
          //         'Sign up with Google',
          //         style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          //       )),
          // ),
          //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          FutureBuilder(
            future: Authentication.initializeFirebase(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GoogleSignInButton();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.blue[500],
                    minimumSize: Size(double.infinity, 50)),
                icon: FaIcon(
                  FontAwesomeIcons.envelope,
                ),
                label: Text(
                  'Sign up with email',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )),
          ),
          SizedBox(
            height: scaler.getHeight(2.5),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Already have account? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                  text: 'Login',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Login Text Clicked');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => emailSignUpPage()),
                      );
                    }),
            ]),
          ),
        ],
      ),
    ));
  }
}
