import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath:
              json["backdrop_path"] ?? '/6x7yvYQjVvqGHf9fkLUUlHAFo9R.jpg',
          id: json["id"]);
}
