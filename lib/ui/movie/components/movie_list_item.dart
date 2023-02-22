import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../../constants/constants.dart';

class MovieListItem extends StatelessWidget {
  final MovieModel movieModel;

  const MovieListItem({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 170,
      child: Column(
        children: [
          Image.network(
            kmoviedbImageURL + movieModel.posterPath.toString(),
            height: 150,
            fit: BoxFit.fitWidth,
          ),
          Text(
            movieModel.title.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
          ),
          Text(
            movieModel.overview.toString(),
            style: TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
