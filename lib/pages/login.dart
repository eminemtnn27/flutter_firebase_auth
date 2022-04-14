import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_firebase_auth/Home.dart';
import 'package:flutter_firebase_auth/pages/register.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String userEmail='';
  bool isload = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isload
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: key,
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logos/back.jpg"),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Color(0xff5f9ced),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFFFFFFF),
                              Color(0xFFFFFFFF) //0xFFB60B4F //0xFFD51D0E
                            ],
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 70.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                  image:
                                      AssetImage("assets/logos/favicon_1.png"),
                                  width: 97),
                              Text(
                                '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Lütfen mail adresinizi girin";
                                        }
                                      },
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white70,
                                        filled: true,
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Color(0xFFD51D0E)),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 14.0),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: Color(0xFFD51D0E),
                                        ),
                                        hintText: "Mail Adresinizi Girin",
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      obscureText: _passwordVisible,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Lütfen şifrenizi girin";
                                        }
                                      },
                                      onChanged: (value) {
                                        password = value;
                                      },
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white70,
                                        filled: true,
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Color(0xFFD51D0E)),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 14.0),
                                        prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          color: Color(0xFFD51D0E),
                                        ),
                                        hintText: "Şifrenizi Girin",
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.0),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Color(0xFFD51D0E),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible
                                                  ? _passwordVisible = false
                                                  : _passwordVisible = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    /*button*/
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        width: double.infinity,
                                        child: RaisedButton(
                                          elevation: 5.0,
                                          padding: EdgeInsets.all(5.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: Color(0xFFD51D0E),
                                          child: Text(
                                            'GİRİŞ YAP',
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.5,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (key.currentState!.validate()) {
                                              setState(() {
                                                isload = true;
                                              });
                                              try {
                                                await _auth
                                                    .signInWithEmailAndPassword(
                                                        email: email,
                                                        password: password);

                                                await Navigator.of(context)
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home(),
                                                  ),
                                                );

                                                setState(() {
                                                  isload = false;
                                                });
                                              } on FirebaseAuthException catch (e) {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                    title: Text(
                                                        "Giriş başarısız oldu!"),
                                                    content:
                                                        Text('Bilgilerinizi kontrol ediniz'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: Text('Ok'),
                                                      )
                                                    ],
                                                  ),
                                                );
                                                print(e);
                                              }
                                              setState(() {
                                                isload = false;
                                              });
                                            }
                                          },
                                        )),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: FlatButton(
                                        onPressed: () => print(
                                            'Şifremi Unuttum Button Pressed'),
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'Şifremi Unuttum?',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'RobotoMono',
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*socialbuttons*/
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          '- Ya Da -',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        Text(
                                          'ile Giriş Yap',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'RobotoMono',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            minWidth: 10,
                                            color: Colors.white,
                                            onPressed: () {
                                              GoogleSignIn().signIn();
                                            },
                                            child: Image.asset(
                                              'assets/logos/google.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            shape: CircleBorder(),
                                          ),
                                          MaterialButton(
                                            minWidth: 10,
                                            color: Colors.white,
                                            onPressed: ()      async {
                                             await signInWithFacebook();
                                             Navigator.push(
                                                 context,
                                                 MaterialPageRoute(
                                                     builder: (_) => Home()));
                                            },
                                            child: Image.asset(
                                              'assets/logos/facebook.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            shape: CircleBorder(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => Register()));
                                        },
                                        child: RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Bir hesabın var mı? ',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Üye Ol',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email','public_profile']
    );
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final userData=await FacebookAuth.instance.getUserData();
     userEmail=userData["email"];
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
