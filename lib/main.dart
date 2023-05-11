import 'package:flutter/material.dart';
import 'package:movio/theme/app_theme.dart';
import 'package:movio/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top
  ]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      title: "Flutter app",
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List upcomingMovies = [];
  final String apikey = 'dcbcdc692be0796a2f47210534fbdf17';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkY2JjZGM2OTJiZTA3OTZhMmY0NzIxMDUzNGZiZGYxNyIsInN1YiI6IjY0NWE0ODJhNzdkMjNiMDEzNjVlMmE5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HCETyrYcusOorwTkTJk0phtdp6pHXDdw8TCNLH7dZ0g';
  @override
  initState() {
    loadMovies();
    super.initState();

  }


  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map upcomingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    // print(upcomingResult);
    //
    // print(upcomingResult['results']);
    setState(() {
      // TODO: implement setState
      upcomingMovies = upcomingResult['results'];
    });
    print(upcomingMovies);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.silverWhite,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
            color: AppTheme.colors.darkSlateBlue,
          ),
        ],
        backgroundColor: AppTheme.colors.lavenderMist,
        title: Text(
          "Watch",
          style: TextStyle(
            color: AppTheme.colors.darkSlateBlue,
          ),
        ),
      ),
      body: ListView(
        children: [
          UpcomingMovies(upcoming: upcomingMovies),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        items: <DotNavigationBarItem>[
          DotNavigationBarItem(
            icon: const Icon(Icons.dashboard),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.play_circle_fill_outlined),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.folder_copy),
          ),
          DotNavigationBarItem(
            icon:const Icon(Icons.list),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        backgroundColor: AppTheme.colors.darkSlateBlue,
        enablePaddingAnimation: false,
        dotIndicatorColor: AppTheme.colors.darkSlateBlue,

      ),

    );
  }
}





