import 'package:flutter/material.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatelessWidget {
  final _movies = [
    Movie(
        imageName: 'images/movie_placeholder.png',
        title: 'Смертельная битва',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        imageName: 'images/movie_placeholder.png',
        title: 'Смертельная битва',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        imageName: 'images/movie_placeholder.png',
        title: 'Смертельная битва',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        imageName: 'images/movie_placeholder.png',
        title: 'Смертельная битва',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        imageName: 'images/movie_placeholder.png',
        title: 'Смертельная битва',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
  ];

  MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _movies.length,
        itemExtent: 150,
        itemBuilder: (BuildContext context, int index) {
          final movie = _movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        )
                      ]),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: AssetImage(movie.imageName)),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              movie.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(movie.time,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 15),
                            Text(
                              movie.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    onTap: () {
                      print('11');
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
