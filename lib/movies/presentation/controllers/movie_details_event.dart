part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMoviesDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMoviesDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMoviesRecommendationEvent extends MovieDetailsEvent {
  final int id;

  const GetMoviesRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
