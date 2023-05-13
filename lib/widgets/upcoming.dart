import 'package:flutter/material.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;

  const UpcomingMovies({super.key, required this.upcoming});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              height: 800,
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: upcoming.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 200,
                          child: Stack(
                            children: [
                              Container(

                                decoration: BoxDecoration(

                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),

                                    color:Colors.black,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'http://image.tmdb.org./t/p/w500' +
                                              upcoming[index]
                                                  ['backdrop_path'])),
                                  boxShadow: null
                                ),
                                child: Align(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: Container(
                                      width: 300,
                                      child: Text(
                                        upcoming[index]['title'] ??
                                            'loading..',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius:
                                              30.0, // soften the shadow
                                          spreadRadius:
                                              2.0, //extend the shadow
                                          offset: Offset(
                                            2.0, // Move to right 5  horizontally
                                            0.0, // Move to bottom 5 Vertically
                                          ),
                                        ),
                                          ]),
                                      padding: const EdgeInsets.only(bottom: 8),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
