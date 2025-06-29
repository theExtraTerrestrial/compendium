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

  /// Factory constructor that creates AnimeModel from JSON media object
  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['id'] ?? 0,
      title: json['title']?['english'] ?? 'Unknown Title',
      coverImageUrl: json['coverImage']?['extraLarge'] ?? '',
      color: json['coverImage']['color'] != null
          ? _colorFromHexString(json['coverImage']['color'])
          : Colors.white,
      bannerImageUrl: json['bannerImage'],
      genres: json['genres'] != null ? List<String>.from(json['genres']) : <String>[],
      score: json['meanScore'] ?? 0,
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
