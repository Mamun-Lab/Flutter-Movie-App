import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../constants/constants.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieModel;

  const MovieDetails({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movieModel.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 240,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: kmoviedbImageURL + movieModel.posterPath.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              movieModel.title.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
            Row(
              children: [
                RatingBarIndicator(
                  rating: movieModel.voteAverage ?? 0,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  movieModel.voteAverage == null
                      ? ""
                      : movieModel.voteAverage.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),

            Text(
              movieModel.overview.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
