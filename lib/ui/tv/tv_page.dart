import 'package:flutter/material.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/ui/tv/tv_category.dart';

class TVPage extends StatefulWidget {
  const TVPage({Key? key}) : super(key: key);

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: const [
            SizedBox(height: 8,),
            Text(
              "Popular TV",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            SizedBox(height: 8,),
            SizedBox(
              child: TvCategory(
                tvType: TvType.popular,
              ),
              height: 250,
            ),
            SizedBox(height: 8,),
            Text(
              "Top Rated TV",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            SizedBox(height: 8,),
            SizedBox(
              child: TvCategory(
                tvType: TvType.topRated,
              ),
              height: 250,
            ),
            SizedBox(height: 8,),
            Text(
              "On The Air",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            SizedBox(height: 8,),
            SizedBox(
              child: TvCategory(
                tvType: TvType.onTheAir,
              ),
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
