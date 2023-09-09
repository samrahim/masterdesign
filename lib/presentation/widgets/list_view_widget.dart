import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterdesign/blocs/bloc/news_bloc.dart';
import 'package:masterdesign/presentation/screens/details_screen.dart';

// ignore: must_be_immutable
class CostumeListView extends StatelessWidget {
  NewsLoaded state;
  CostumeListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state.news.length,
        itemBuilder: (context, ind) {
          final indexoft = state.news[ind].publishedAt!.indexOf("T");
          final dateWithoutTime =
              state.news[ind].publishedAt!.substring(0, indexoft);
          return state.news[ind].urlToImage != null &&
                  state.news[ind].title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreenNews(
                                  newsModel: state.news[ind],
                                  category: "Categorie")));
                    },
                    child: Container(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                      state.news[ind].urlToImage!,
                                      fit: BoxFit.cover),
                                )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, left: 4),
                                child: Column(
                                  children: [
                                    Text(
                                      state.news[ind].title!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.timer),
                                        Text(
                                          dateWithoutTime,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              : null;
        });
  }
}
