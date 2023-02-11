import 'package:movies_app/movies/domain/entities/genrs.dart';

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(name: json["name"], id: json["id"]);
}
