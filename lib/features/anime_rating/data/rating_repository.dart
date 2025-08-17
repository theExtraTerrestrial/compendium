import 'dart:convert';

import 'package:compendium/features/anime_rating/data/rating_repository_interface.dart';
import 'package:compendium/features/anime_rating/models/anime_rating_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingRepository implements RatingRepositoryInterface {
  static const _prefsKey = 'anime_ratings_map_v1';

  @override
  Future<List<AnimeRatingModel>> loadInitial() async {
    final String jsonString = await rootBundle.loadString('assets/data/anime_ratings.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    final data = jsonData['data'];
    if (data == null) return [];

    final mediaListCollection = data['MediaListCollection'];
    if (mediaListCollection == null) return [];

    final lists = mediaListCollection['lists'] as List<dynamic>?;
    if (lists == null || lists.isEmpty) return [];

    final entries = lists[0]['entries'] as List<dynamic>?;
    if (entries == null) return [];

    final mediaList = entries.map((entry) => entry['media'] as Map<String, dynamic>).toList();
    final items = mediaList.map((m) => AnimeRatingModel.fromJson(m)).toList();

    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefsKey);
    if (saved != null) {
      try {
        final Map<String, dynamic> map = json.decode(saved);
        for (final item in items) {
          final savedRating = map['${item.id}'];
          if (savedRating != null) {
            final updated = item.copyWith(rating: savedRating as int);
            final index = items.indexOf(item);
            items[index] = updated;
          }
        }
      } catch (_) {}
    }

    return items;
  }

  Future<Map<int, int>> _loadPrefsMap() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefsKey);
    if (saved == null) return {};
    try {
      final Map<String, dynamic> map = json.decode(saved);
      return map.map((k, v) => MapEntry(int.parse(k), v as int));
    } catch (_) {
      return {};
    }
  }

  Future<void> _savePrefsMap(Map<int, int> map) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = json.encode(map.map((k, v) => MapEntry(k.toString(), v)));
    await prefs.setString(_prefsKey, encoded);
  }

  @override
  Future<Map<int, int>> loadAllRatings() async {
    return _loadPrefsMap();
  }

  @override
  Future<int?> getRating(int animeId) async {
    final map = await _loadPrefsMap();
    return map[animeId];
  }

  @override
  Future<void> saveRating(int animeId, int rating) async {
    final map = await _loadPrefsMap();
    map[animeId] = rating;
    await _savePrefsMap(map);
  }

  @override
  Future<void> removeRating(int animeId) async {
    final map = await _loadPrefsMap();
    if (map.containsKey(animeId)) {
      map.remove(animeId);
      await _savePrefsMap(map);
    }
  }

  @override
  Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }
}
