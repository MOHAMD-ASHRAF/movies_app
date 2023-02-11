import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecse.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUseCass, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_geRecommendation);
  }

  final GetMoviesDetailsUseCass getMoviesDetailsUseCass;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      event, Emitter<MovieDetailsState> emit) async {
    final result = await getMoviesDetailsUseCass(
        MovieDetailsParameters(movieId: event.id));
    result.fold(
            (l) => emit(state.copyWith(
              moviesDetailsState: RequestState.error,
              movieDetailsMessage: l.message
            )),
            (r) => emit(state.copyWith(
              movieDetail: r,
              moviesDetailsState: RequestState.loaded,
            ))
    );
  }

  FutureOr<void> _geRecommendation(GetMoviesRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(
        RecommendationParameters(event.id));
    result.fold(
            (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message
        )),
            (r) => emit(state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ))
    );
  }
}
