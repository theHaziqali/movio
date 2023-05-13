import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List category;

  Categories({super.key, required this.category});
  final List categoryImages = [
    'assets/images/comedies.png',
    'assets/images/crime.pmg',
    'assets/images/documentaries.png',
    'assets/images/drama.png',
    'assets/images/family.png',
    'assets/images/fantasy.png',
    'assets/images/horror.png',
    'assets/images/thriller.png',
    'assets/images/holidays.png',
    'assets/images/scifi.png',








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
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.blue,
                            padding: const EdgeInsets.only(
                                left: 22, right: 8, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                Container(
                                  width: 160,
                                  height: 120,
                                  padding: const EdgeInsets.all(52),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(22)),
                                      color: Colors.amber),
                                  child: Text(
                                    category[2 * index + 1]['name'],
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                Container(
                                  width: 160,
                                  height: 120,
                                  padding: const EdgeInsets.all(52),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(22),
                                      ),
                                      color: Colors.greenAccent),
                                  child: Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Text(
                                      category[2 * index + 2]['name'],
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
