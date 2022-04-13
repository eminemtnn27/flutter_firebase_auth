import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String username = '';
  String email = '';
  String password = '';
  bool isload = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.2), //grey.withOpacity(0.2),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
              color: Colors.black,
            )),
      ),
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
                              SizedBox(height: 1),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                        image:
                                            AssetImage("assets/logos/leaf.png"),
                                        width: 97),
                                    SizedBox(height: 33.0),
                                    TextFormField(
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) {
                                        username = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Lütfen kullanıcı adınızı giriniz";
                                        }
                                      },
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
                                          Icons.text_format,
                                          color: Color(0xFFD51D0E),
                                        ),
                                        hintText: "Kullanıcı Adınızı Girin",
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    SizedBox(height: 18.0),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Lütfen mail adresinizi giriniz";
                                        }
                                      },
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
                                          Icons.email_outlined,
                                          color: Color(0xFFD51D0E),
                                        ),
                                        hintText: "Mail Adresinizi Girin",
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    SizedBox(height: 18.0),
                                    TextFormField(
                                      obscureText: _passwordVisible,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter Password";
                                        }
                                      },
                                      onChanged: (value) {
                                        password = value;
                                      },
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
                                          'Kaydol',
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.5,
                                            fontSize: 17.0,
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
                                                  .createUserWithEmailAndPassword(
                                                      email: email,
                                                      password: password);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor:
                                                      Colors.blueGrey,
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        'Kayıt başarıyla oluşturuldu. Şimdi giriş yapabilirsiniz'),
                                                  ),
                                                  duration:
                                                      Duration(seconds: 5),
                                                ),
                                              );
                                              Navigator.of(context).pop();

                                              setState(() {
                                                isload = false;
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title:
                                                      Text('Kayıt başarısız'),
                                                  content: Text('Bilgilerinizi kontrol ediniz'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      child: Text('Ok'),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }
                                            setState(() {
                                              isload = false;
                                            });
                                          }
                                        },
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
}
