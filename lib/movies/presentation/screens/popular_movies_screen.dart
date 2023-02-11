
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/components/List_popular.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';


class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
      child: BlocBuilder<MoviesBloc ,MoviesState>(
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(title: const Text('popular movies'),),
            body: const ListPopularComponent(),
          );
        }
      ),
    );
  }
}
