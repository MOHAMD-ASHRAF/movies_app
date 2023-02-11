part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState moviesDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;


  const MovieDetailsState({
    this.movieDetail,
    this.moviesDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const[],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? moviesDetailsState,
    String? movieDetailsMessage,
     List<Recommendation>? recommendation,
     RequestState? recommendationState,
      String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }


  @override
  List<Object?> get props =>
      [movieDetail, moviesDetailsState, movieDetailsMessage,recommendation,recommendationState,recommendationMessage];
}
