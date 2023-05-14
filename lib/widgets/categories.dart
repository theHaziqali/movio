import 'package:flutter/material.dart';
import 'package:movio/theme/app_theme.dart';

class Categories extends StatelessWidget {
  final List category;

  Categories({super.key, required this.category});
  final List categoryImages = [
    'assets/images/adventure.png',
    'assets/images/animation.png',
    'assets/images/comedies.png',
    'assets/images/crime.png',
    'assets/images/documentaries.png',
    'assets/images/drama.png',
    'assets/images/family.png',
    'assets/images/fantasy.png',
    'assets/images/history.png',
    'assets/images/horror.png',
    'assets/images/music.png',
    'assets/images/mystery.png',
    'assets/images/romance.png',
    'assets/images/scifi.png',
    'assets/images/tvmovies.png',
    'assets/images/thriller.png',
    'assets/images/war.png',
    'assets/images/western.png',
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(category);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 720,
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
                itemCount: (category.length) ~/ 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.blue,
                                padding: const EdgeInsets.only(
                                    left: 22, right: 8, top: 8, bottom: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: const EdgeInsets.all(52),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  categoryImages[
                                                      (2 * index)]),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(22)),
                                          color: Colors.amber),
                                      child: FittedBox(
                                          alignment: Alignment.bottomLeft,

                                          fit: BoxFit.scaleDown,

                                          child: Text(
                                        category[2 * index + 1]['name'],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                AppTheme.colors.lavenderMist),
                                      )),
                                    )),
                                    const SizedBox(
                                      width: 10,
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(52),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    categoryImages[
                                                        (2 * index) + 1]),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(22),
                                            ),
                                            color: Colors.greenAccent),
                                        child: FittedBox(
                                          alignment: Alignment.bottomLeft,
                                          fit: BoxFit.scaleDown,
                                          child: Text(

                                            category[2 * index + 2]['name'],
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppTheme
                                                    .colors.lavenderMist),
                                          ),
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: MediaQuery.of(context).size.width>=450 ? 60:10,
                                      height: 10,
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
