import 'package:flutter/material.dart';
import 'package:masterdesign/blocs/bloc/news_bloc.dart';

class CostumeListView extends StatelessWidget {
  NewsLoaded state;
  CostumeListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state.news.length,
        itemBuilder: (context, ind) {
          return state.news[ind].urlToImage != null
              ? SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: 50,
                        child: Image.network(state.news[ind].urlToImage!),
                      ),
                      Text(state.news[ind].author.toString()),
                    ],
                  ),
                )
              : null;
        });
  }
}
