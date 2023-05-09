
import 'package:flutter/material.dart';
import 'package:movio/theme/app_theme.dart';
import 'package:movio/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(const App());
}
class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',),
      title: "Flutter app",



    );
  }
}
class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
backgroundColor: AppTheme.colors.lavenderMist,
     appBar: AppBar(
      elevation: 0,
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.search),
           onPressed: () {},
           color: AppTheme.colors.darkSlateBlue,
         ),
       ],
       backgroundColor: AppTheme.colors.silverWhite,
       title: Text(
         "Watch",
         style: TextStyle(
           color: AppTheme.colors.darkSlateBlue,
         ),
       ),
     ),   );
  }

}
