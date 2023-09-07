// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:masterdesign/blocs/bloc/news_bloc.dart';

// ignore: must_be_immutable
class CostumeTabBar extends StatelessWidget {
  TabController tabController;
  CostumeTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: Colors.black,
      isScrollable: true,
      labelColor: Colors.red,
      onTap: (value) {
        BlocProvider.of<NewsBloc>(context).add(GetAllNews(value));
      },
      tabs: const [
        Tab(
          child: Text("Business",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
        Tab(
          child: Text("Entertainment",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
        Tab(
          child: Text("General",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
        Tab(
          child: Text("Health",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
        Tab(
          child: Text("Science",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
        Tab(
          child: Text("Sports",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
        Tab(
          child: Text("Technology",
              style: TextStyle(fontSize: 24, color: Colors.black)),
        ),
      ],
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }
}
