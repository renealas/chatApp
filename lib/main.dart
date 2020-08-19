import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/chat_screen.dart';
import './screens/auth_screen.dart';
import './screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatPropios',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        backgroundColor: Colors.lightGreen,
        accentColor: Colors.deepOrange,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.deepOrange,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder: (ctx, userSnapShot) {
        if(userSnapShot.connectionState == ConnectionState.waiting){
          return SplashScreen();
        }
        if(userSnapShot.hasData){
          return ChatScreen();
        }
        return AuthScreen();
      }
      ),
    );
  }
}
