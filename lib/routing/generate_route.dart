import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterdesign/blocs/bloc/news_bloc.dart';
import 'package:masterdesign/data/news_web_service.dart';
import 'package:masterdesign/presentation/screens/home_screen.dart';
import 'package:masterdesign/repository/news_repository.dart';

class Routing {
  late Repository repository;
  late NewsBloc bloc;
  Routing() {
    repository = Repository(WebService());
    bloc = NewsBloc(repository)..add(GetAllNews(0));
  }
  Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => bloc,
                  child: const HomeScreen(),
                ));
    }
    return null;
  }
}
