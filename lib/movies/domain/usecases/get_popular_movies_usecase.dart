import 'package:dartz/dartz.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getPopularMovies();
  }
}