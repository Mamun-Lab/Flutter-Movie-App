import 'package:flutter/material.dart';
import 'package:movie_app/model/tv_model.dart';

import '../../service/api_service.dart';
import 'components/tv_list_item.dart';

class TvCategory extends StatefulWidget {
  final TvType tvType;
  const TvCategory({Key? key,required this.tvType}) : super(key: key);

  @override
  State<TvCategory> createState() => _TvCategoryState();
}

class _TvCategoryState extends State<TvCategory> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<TVModel> tvmodel = snapshot.data ?? [];

          return ListView.builder(
            itemBuilder: (context, index) {
              return TvListItem(tvModel: tvmodel[index]);
            },
            itemCount: tvmodel.length,
            scrollDirection: Axis.horizontal,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: apiService.getTVData(widget.tvType),
    );
  }
}
