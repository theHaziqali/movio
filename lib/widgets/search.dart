import 'package:flutter/material.dart';
import 'package:movio/widgets/categories.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../theme/app_theme.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  String item = "";
  final TextEditingController _controller = TextEditingController();
  List categories = [];
  final String apikey = 'dcbcdc692be0796a2f47210534fbdf17';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkY2JjZGM2OTJiZTA3OTZhMmY0NzIxMDUzNGZiZGYxNyIsInN1YiI6IjY0NWE0ODJhNzdkMjNiMDEzNjVlMmE5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HCETyrYcusOorwTkTJk0phtdp6pHXDdw8TCNLH7dZ0g';

  loadCategories() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map categoriesResult = await tmdbWithCustomLogs.v3.genres.getMovieList();
    Map categoriesImgResult = await tmdbWithCustomLogs.v3.discover.getMovies();

    print(categoriesImgResult);
    //
    print(categoriesResult['genres']);
    setState(() {
      // TODO: implement setState
      categories = categoriesResult['genres'];
    });
    // print(categories);
  }

  @override
  initState() {
    loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppTheme.colors.silverWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    alignment: AlignmentDirectional.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.colors.silverWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                    ),
                    child: Row(
                      children: [
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: _controller,
                          decoration: InputDecoration(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width >= 450
                                          ? 730
                                          : 300),
                              border: InputBorder.none,
                              hintText: "Search Movies,shows and etc",
                              hintStyle: TextStyle(
                                  color: AppTheme.colors.darkSlateBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Acme'),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                                color: AppTheme.colors.darkSlateBlue,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.clear();
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: AppTheme.colors.darkSlateBlue,
                                ),
                              )),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppTheme.colors.darkSlateBlue,
                              fontFamily: 'Acme'),
                          onChanged: (value) {
                            item = value;
                            // print("text input");
                            // print(item);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
                height: 100,
              )
            ],
          )
        ],
        backgroundColor: AppTheme.colors.lavenderMist,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Categories(
            category:categories
          )
        ],
      ),
    );
  }
}
