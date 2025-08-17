import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AnimeModel {
  final int id;
  final String title;
  final String coverImageUrl;
  final String? bannerImageUrl;
  final List<String> genres;
  final int score;
  final Color? color;

  AnimeModel({
    required this.id,
    required this.title,
    required this.coverImageUrl,
    this.bannerImageUrl,
    required this.genres,
    required this.score,
    this.color,
  });

  /// Shared parsing logic for AnimeModel and subclasses
  static (
    int id,
    String title,
    String coverImageUrl,
    String? bannerImageUrl,
    List<String> genres,
    int score,
    Color? color,
  ) parseBaseFields(Map<String, dynamic> json) {
    return (
      json['id'] ?? 0,
      json['title']?['english'] ?? 'Unknown Title',
      json['coverImage']?['extraLarge'] ?? '',
      json['bannerImage'],
      json['genres'] != null ? List<String>.from(json['genres']) : <String>[],
      json['meanScore'] ?? 0,
      json['coverImage'] != null && json['coverImage']['color'] != null
          ? _colorFromHexString(json['coverImage']['color'])
          : Colors.white,
    );
  }

  /// Factory constructor that creates AnimeModel from JSON media object
  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    final (
      id,
      title,
      coverImageUrl,
      bannerImageUrl,
      genres,
      score,
      color,
    ) = parseBaseFields(json);
    return AnimeModel(
      id: id,
      title: title,
      coverImageUrl: coverImageUrl,
      bannerImageUrl: bannerImageUrl,
      genres: genres,
      score: score,
      color: color,
    );
  }

  static Color _colorFromHexString(String hexColor) {
    if (hexColor.isEmpty) {
      return Colors.white; // Default color if hex string is empty
    }
    try {
      return HexColor(hexColor);
    } catch (e) {
      return Colors.white; // Fallback color in case of error
    }
  }
}
