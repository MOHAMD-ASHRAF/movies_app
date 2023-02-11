import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMoviesDetailsUseCass extends BaseUseCase<MovieDetail , MovieDetailsParameters>{

 final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCass(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async {
  return baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable{
 final int movieId;
 const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];

}