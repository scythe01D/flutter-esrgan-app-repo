import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esrgan_app/emailSignUpPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("AAAAAAAAAAA"),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 4, 40, 4),
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
                  FontAwesomeIcons.google,
                ),
                label: Text(
                  'Sign up with Google',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 4, 40, 4),
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
            height: 30,
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

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "Already have an account? ",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         fontSize: 12,
          //       ),
          //     ),
          //     InkWell()(
          //       child: Text(
          //         "Log in",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    ));
  }
}
