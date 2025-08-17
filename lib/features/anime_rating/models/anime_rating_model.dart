import 'package:compendium/core/models/anime_model.dart';
import 'package:flutter/material.dart';

class AnimeRatingModel extends AnimeModel {
  final int rating;

  AnimeRatingModel({
    required super.id,
    required super.title,
    required super.coverImageUrl,
    super.bannerImageUrl,
    required super.genres,
    required super.score,
    super.color,
    this.rating = 0,
  });

  factory AnimeRatingModel.fromJson(Map<String, dynamic> json) {
    final (
      id,
      title,
      coverImageUrl,
      bannerImageUrl,
      genres,
      score,
      color,
    ) = AnimeModel.parseBaseFields(json);
    return AnimeRatingModel(
      id: id,
      title: title,
      coverImageUrl: coverImageUrl,
      bannerImageUrl: bannerImageUrl,
      genres: genres,
      score: score,
      color: color,
      rating: json['rating'] ?? 0,
    );
  }

  AnimeRatingModel copyWith({
    int? id,
    String? title,
    String? coverImageUrl,
    String? bannerImageUrl,
    List<String>? genres,
    int? score,
    Color? color,
    int? rating,
  }) {
    return AnimeRatingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      genres: genres ?? this.genres,
      score: score ?? this.score,
      color: color ?? this.color,
      rating: rating ?? this.rating,
    );
  }
}
