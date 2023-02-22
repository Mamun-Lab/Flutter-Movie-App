import 'package:flutter/material.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/ui/movie/movies_category.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: const [
            SizedBox(height: 8,),
            Text(
              "Popular Movie",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            SizedBox(height: 8,),
            SizedBox(
              child: MoviesCategory(
                movieType: MovieType.popular,
              ),
              height: 250,
            ),
            SizedBox(height: 8,),
            Text(
              "Top Rated Movie",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            SizedBox(height: 8,),
            SizedBox(
              child: MoviesCategory(
                movieType: MovieType.topRated,
              ),
              height: 250,
            ),
            SizedBox(height: 8,),
            Text(
              "Upcoming Movie",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            SizedBox(height: 8,),
            SizedBox(
              child: MoviesCategory(
                movieType: MovieType.upcoming,
              ),
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
