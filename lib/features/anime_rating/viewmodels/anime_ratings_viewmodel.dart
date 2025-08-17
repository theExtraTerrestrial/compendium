
import 'dart:convert';

import 'package:compendium/core/viewmodels/base_viewmodel.dart';
import 'package:compendium/features/anime_rating/models/anime_rating_model.dart';
import 'package:flutter/services.dart';

class AnimeRatingsViewModel extends BaseViewModel {
  List<AnimeRatingModel> _animeRatings = [];

  get animeRatings => List.unmodifiable(_animeRatings);

  AnimeRatingsViewModel.initial() {
    loadInitialRatings();
  }

  AnimeRatingsViewModel();

  factory AnimeRatingsViewModel.fromJson(List<dynamic> mediaList) {
    final viewModel = AnimeRatingsViewModel();

    try {
      viewModel._animeRatings = mediaList.map<AnimeRatingModel>((media) {
        if (media == null) throw Exception('Invalid entry: null media object');
        return AnimeRatingModel.fromJson(media);
      }).toList();

      viewModel.clearError();
    } catch (e) {
      viewModel.setError('Failed to parse JSON data: $e');
    }

    return viewModel;
  }

  void loadInitialRatings() async {
    setLoading(true);

    try {
      // Load JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/data/anime_ratings.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Extract media objects from the existing JSON structure
      final data = jsonData['data'];
      if (data == null) throw Exception('Invalid JSON structure: missing data');

      final mediaListCollection = data['MediaListCollection'];
      if (mediaListCollection == null) throw Exception('Invalid JSON structure: missing MediaListCollection');

      final lists = mediaListCollection['lists'] as List<dynamic>?;
      if (lists == null || lists.isEmpty) throw Exception('Invalid JSON structure: missing lists');

      final entries = lists[0]['entries'] as List<dynamic>?;
      if (entries == null) throw Exception('Invalid JSON structure: missing entries');

      // Extract media objects and use factory constructor
      final mediaList = entries.map((entry) => entry['media']).toList();
      final tempViewModel = AnimeRatingsViewModel.fromJson(mediaList);

      if (tempViewModel.hasError) {
        setError(tempViewModel.errorMessage!);
      } else {
        _animeRatings = tempViewModel._animeRatings;
        setLoading(false);
        clearError();
      }
    } catch (e) {
      setError('Failed to load anime collection: $e');
    }
  }

}
