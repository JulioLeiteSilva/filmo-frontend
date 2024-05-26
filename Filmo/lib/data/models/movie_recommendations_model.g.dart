// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_recommendations_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieRecommendationsAdapter extends TypeAdapter<MovieRecommendations> {
  @override
  final int typeId = 2;

  @override
  MovieRecommendations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieRecommendations(
      genre: fields[0] as String,
      movies: (fields[1] as List).cast<MovieModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieRecommendations obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.genre)
      ..writeByte(1)
      ..write(obj.movies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieRecommendationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
