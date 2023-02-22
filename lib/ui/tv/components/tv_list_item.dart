import 'package:flutter/material.dart';
import 'package:movie_app/model/tv_model.dart';

import '../../../constants/constants.dart';

class TvListItem extends StatelessWidget {
  final TVModel tvModel;
  const TvListItem({Key? key,required this.tvModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 170,
      child: Column(
        children: [
          Image.network(
            kmoviedbImageURL + tvModel.posterPath.toString(),
            height: 150,
            fit: BoxFit.fitWidth,
          ),
          Text(
            tvModel.originalName.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
          ),
          Text(
            tvModel.overview.toString(),
            style: TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
