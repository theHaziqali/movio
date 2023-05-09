import 'package:flutter/material.dart';
class UpcomingMovies extends StatelessWidget{
  final List upcoming;

  const UpcomingMovies({super.key, required this.upcoming});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 800,
            padding: EdgeInsets.all(4),
          child: ListView.builder(itemCount: upcoming.length,
              scrollDirection: Axis.vertical,

              itemBuilder: (context,index){
            return InkWell(
              onTap:(){

              } ,
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    Container(
                      height:200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:NetworkImage(
                          'http://image.tmdb.org./t/p/w500'+upcoming[index]['poster_path']
                        )
                        )
                      ),
                    ),
                    Container(child: Text(upcoming[index]['title']?? 'loading'),)
                  ],
                ),
              ),
            );
              },
            )

          )
        ],
      ),
    );
  }

}