import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: 'images/movie_placeholder.png',
        title: 'Elvis',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        id: 2,
        imageName: 'images/movie_placeholder.png',
        title: 'Top Gun: Maverick',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        id: 3,
        imageName: 'images/movie_placeholder.png',
        title: 'Doctor Strange in the Multiverse of Madness',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        id: 4,
        imageName: 'images/movie_placeholder.png',
        title: 'Thor: Love and Thunder',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
    Movie(
        id: 5,
        imageName: 'images/movie_placeholder.png',
        title: 'The Black Phone',
        time: 'April 7, 2021',
        description:
            'Set in ninth-century China during a time of unrest that would eventually lead to the decline of the Tand Dynasty, "The Assassin" tells the story of Nie Yinniang (Shu Qui), who was kidnapped by her family when she was only 10 by Jiaxin (Sheu Fang-yi), a nun who trained her to become a brutally efficient assassin'),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      'main_screen/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
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
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(400),
              border: OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}
