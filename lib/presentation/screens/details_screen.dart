// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masterdesign/data/news_model.dart';
import 'package:masterdesign/presentation/widgets/costume_container.dart';

class DetailsScreenNews extends StatelessWidget {
  NewsModel newsModel;
  String category;
  DetailsScreenNews(
      {required this.newsModel, super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: const EdgeInsets.only(top: 12),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2)),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 32)),
          ),
        ),
        body: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topCenter,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.5), BlendMode.darken),
              child: Image.network(newsModel.urlToImage!,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 7),
                    CostumeContainer(textchild: "Categorie"),
                    Text(newsModel.title ?? '',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    Text(newsModel.content ?? "Null",
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                  ],
                )),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 2 - 20,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CostumeContainer(textchild: newsModel.author ?? ""),
                          const SizedBox(height: 8),
                          Text(newsModel.title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 8),
                          Text(newsModel.content ?? "",
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300)),
                          const SizedBox(height: 8),
                          Text(newsModel.description ?? "Null",
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300)),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
