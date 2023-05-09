
import 'package:flutter/material.dart';
import 'package:movio/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:movio/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

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
  List upcomingMovies=[];
  final String apikey='dcbcdc692be0796a2f47210534fbdf17';
  final readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkY2JjZGM2OTJiZTA3OTZhMmY0NzIxMDUzNGZiZGYxNyIsInN1YiI6IjY0NWE0ODJhNzdkMjNiMDEzNjVlMmE5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HCETyrYcusOorwTkTJk0phtdp6pHXDdw8TCNLH7dZ0g';
  @override
  initState(){
loadMovies();
super.initState();


  }

  loadMovies() async{
     TMDB tmdbWithCustomLogs =TMDB(ApiKeys(apikey,readAccessToken),logConfig: ConfigLogger(
       showLogs: true,
       showErrorLogs: true
     ));
     Map upcomingResult=await tmdbWithCustomLogs.v3.movies.getUpcoming();
     // print(upcomingResult);
     //
     // print(upcomingResult['results']);
         setState(() {
       // TODO: implement setState
       upcomingMovies=upcomingResult['results'];});
print(upcomingMovies);
  }

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
     ),   body: ListView(
     children: [
       UpcomingMovies(upcoming: upcomingMovies),
     ],
   ),);
  }

}
