import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterdesign/blocs/bloc/news_bloc.dart';
import 'package:masterdesign/presentation/widgets/list_view_widget.dart';
import 'package:masterdesign/presentation/widgets/search_text_field_widget.dart';
import 'package:masterdesign/presentation/widgets/tab_bar_widget.dart';

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
                  CostumeSearchField(height: height, width: width),
                  CostumeTabBar(tabController: tabController!),
                  Expanded(
                    child: BlocBuilder<NewsBloc, NewsState>(
                      builder: (context, state) {
                        if (state is NewsLoaded) {
                          return TabBarView(
                            controller: tabController,
                            children: [
                              CostumeListView(state: state),
                              CostumeListView(state: state),
                              CostumeListView(state: state),
                              CostumeListView(state: state),
                              CostumeListView(state: state),
                              CostumeListView(state: state),
                              CostumeListView(state: state),
                            ],
                          );
                        } else {
                          return TabBarView(
                            controller: tabController,
                            children: const [
                              Text("data1"),
                              Text("data2"),
                              Text("data3"),
                              Text("data4"),
                              Text("data5"),
                              Text("data6"),
                              Text("data7"),
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
