import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pager.dart';
import 'pages/main_page.dart';
import 'pages/login_page.dart';
import 'pages/ImagePickerPage.dart';
import 'package:apec_app/ui/friends/friends_list_page.dart';

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
String currentProfilePic = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";
String otherProfilePic = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";
 
  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
          currentProfilePic = otherProfilePic;
          otherProfilePic = picBackup;
        });
      }
      MenuHomePage(){
        SystemChrome.setPreferredOrientations(
            <DeviceOrientation>[DeviceOrientation.portraitUp]);
      }
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("User"),
                  accountEmail: new Text("user@gmail.com"),
                  currentAccountPicture: new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(currentProfilePic),
                    ),
                    onTap: () => print("This is your current account."),
                  ),
                  otherAccountsPictures: <Widget>[
                    new GestureDetector(
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(otherProfilePic),
                      ),
                      onTap: () => switchAccounts(),
                    ),
                  ],
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              new ListTile(
                title: new Text("Artisan"),
                trailing: new Icon(Icons.people),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new FriendsListPage())),
              ),
              new ListTile(
                title: new Text("Something else"),
                trailing: new Icon(Icons.arrow_right),
              ),
              new Divider(),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.cancel),
                 onTap: () => Navigator.pop(context),
              ),
            ],
          )
        ),
          body: new Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              new MenuPager(),
            ],
          ),
        );
      }
    
      void setState(Function param0) {}
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

