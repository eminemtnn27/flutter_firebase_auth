import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/pages/login.dart';
import 'package:flutter_firebase_auth/services.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Services auth = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Giriş başarılı'),
            SizedBox(height: 50),
            Container(
              height: 60,
              width: 150,
              child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Text('Çıkış Yap'),
                  ),
                  onPressed: () {
                    auth.SignOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
