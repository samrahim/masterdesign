import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterdesign/blocs/bloc/news_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.menu, color: Colors.black, size: 32),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 12),
                  const Text("Discover",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("News for all over the world",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade300),
                    height: height / 12,
                    width: width - 10,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 22),
                          prefixIcon: const Icon(Icons.search, size: 32),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    ),
                  ),
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    isScrollable: true,
                    labelColor: Colors.red,
                    onTap: (value) {
                      BlocProvider.of<NewsBloc>(context).add(GetAllNews(value));
                    },
                    tabs: const [
                      Tab(
                        child: Text("Business",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      Tab(
                        child: Text("Entertainment",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      Tab(
                        child: Text("General",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      Tab(
                        child: Text("Health",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      Tab(
                        child: Text("Science",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      Tab(
                        child: Text("Sports",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      Tab(
                        child: Text("Technology",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                    ],
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: BlocBuilder<NewsBloc, NewsState>(
                      builder: (context, state) {
                        if (state is NewsLoaded) {
                          return TabBarView(
                            controller: tabController,
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.news.length,
                                  itemBuilder: (context, ind) {
                                    return state.news[ind].urlToImage != null
                                        ? SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: 50,
                                                  child: Image.network(state
                                                      .news[ind].urlToImage!),
                                                ),
                                                Text(state.news[ind].author
                                                    .toString()),
                                              ],
                                            ),
                                          )
                                        : null;
                                  }),
                            ],
                          );
                        } else {
                          return TabBarView(
                            controller: tabController,
                            children: const [
                              Text("data1"),
                              Text("data2"),
                              Text("data1"),
                              Text("data2"),
                              Text("data1"),
                              Text("data2"),
                              Text("data1"),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
