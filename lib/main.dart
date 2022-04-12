import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/bloc/spacex_bloc.dart';
import 'package:spacex_app/bloc/spacex_bloc_observer.dart';
import 'package:spacex_app/repositories/spacex_repositories.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_app/screens/home_page.dart';

void main() {
  final SpacexRepository repository = SpacexRepository(http.Client());

  BlocOverrides.runZoned(
      () => runApp(MyApp(
            repository: repository,
          )),
      blocObserver: SpacexBlocObserver());
}

class MyApp extends StatelessWidget {
  final SpacexRepository repository;

  MyApp({this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpacexBloc(spacexRepository: repository),
      child: MaterialApp(
        title: 'SpaceX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
