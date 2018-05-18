import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pager.dart';
import 'pages/main_page.dart';
import 'pages/login_page.dart';
import 'pages/ImagePickerPage.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      title: 'Dashboard',
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: <String, WidgetBuilder>{
        '/Home':(BuildContext context) => new MainPage(),
        '/Login':(BuildContext context) => new LoginPage(),
        '/User':(BuildContext context) => new MenuHomePage(),
        '/Image1':(BuildContext context) => new ImageApp(),
      },
      home: new LoginPage(),
    );
  }
}

class MenuHomePage extends StatelessWidget {

  MenuHomePage(){
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          new MenuPager(),
        ],
      ),
    );
  }
}

class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          new ImagePickerPage(),
        ],
      ),
    );
  }
}

