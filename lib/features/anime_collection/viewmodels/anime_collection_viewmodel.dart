import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:compendium/features/anime_collection/models/anime_model.dart';
import 'package:compendium/core/viewmodels/base_viewmodel.dart';

/// Manages anime collection state and business logic
class AnimeCollectionViewModel extends BaseViewModel {
  List<AnimeModel> _animeCollection = [];
  AnimeModel? _selectedAnime;

  // Public immutable getters
  List<AnimeModel> get animeCollection => List.unmodifiable(_animeCollection);
  AnimeModel? get selectedAnime => _selectedAnime;
  int get animeCount => _animeCollection.length;
  bool get hasAnime => _animeCollection.isNotEmpty;

  /// Constructor that initializes with sample data
  AnimeCollectionViewModel.initial() {
    _loadInitialData();
  }

  AnimeCollectionViewModel();

  /// Factory constructor that builds from JSON data (expects array of media objects)
  factory AnimeCollectionViewModel.fromJson(List<dynamic> mediaList) {
    final viewModel = AnimeCollectionViewModel();

    try {
      viewModel._animeCollection = mediaList.map((media) {
        if (media == null) throw Exception('Invalid entry: null media object');
        return AnimeModel.fromJson(media);
      }).toList();

      viewModel.clearError();
    } catch (e) {
      viewModel.setError('Failed to parse JSON data: $e');
    }

    return viewModel;
  }

  /// Factory constructor that builds from JSON string (expects array of media objects)
  factory AnimeCollectionViewModel.fromJsonString(String jsonString) {
    try {
      final dynamic jsonData = json.decode(jsonString);
      if (jsonData is List) {
        return AnimeCollectionViewModel.fromJson(jsonData);
      } else {
        throw Exception('Expected JSON array of media objects');
      }
    } catch (e) {
      final viewModel = AnimeCollectionViewModel();
      viewModel.setError('Failed to parse JSON string: $e');
      return viewModel;
    }
  }
  /// Load initial data from JSON file
  void _loadInitialData() async {
    setLoading(true);

    try {
      // Load JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/data/anime_collection.json');
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
      final tempViewModel = AnimeCollectionViewModel.fromJson(mediaList);

      if (tempViewModel.hasError) {
        setError(tempViewModel.errorMessage!);
      } else {
        _animeCollection = tempViewModel._animeCollection;
        setLoading(false);
        clearError();
      }
    } catch (e) {
      setError('Failed to load anime collection: $e');
    }
  }

  // ==========================================
  // BUSINESS LOGIC METHODS
  // ==========================================

  /// Add a new anime to the collection
  void addAnime(AnimeModel anime) {
    try {
      if (_animeCollection.any((existing) => existing.id == anime.id)) {
        setError('Anime already exists in collection');
        return;
      }

      _animeCollection.add(anime);
      clearError();
      notifyListeners();
    } catch (e) {
      setError('Failed to add anime: $e');
    }
  }

  /// Remove an anime from the collection
  void removeAnime(int animeId) {
    try {
      final initialLength = _animeCollection.length;
      _animeCollection.removeWhere((anime) => anime.id == animeId);

      if (_animeCollection.length < initialLength) {
        // Clear selection if removed anime was selected
        if (_selectedAnime?.id == animeId) {
          _selectedAnime = null;
        }
        clearError();
        notifyListeners();
      } else {
        setError('Anime not found in collection');
      }
    } catch (e) {
      setError('Failed to remove anime: $e');
    }
  }

  /// Select an anime
  void selectAnime(int animeId) {
    try {
      final anime = _animeCollection.firstWhere(
        (anime) => anime.id == animeId,
        orElse: () => throw Exception('Anime not found'),
      );

      _selectedAnime = anime;
      clearError();
      notifyListeners();
    } catch (e) {
      setError('Failed to select anime: $e');
    }
  }

  /// Clear the selected anime
  void clearSelection() {
    if (_selectedAnime != null) {
      _selectedAnime = null;
      notifyListeners();
    }
  }

  /// Refresh the collection (with a small delay for user feedback)
  Future<void> refreshCollection({bool useDelay = false}) async {
    setLoading(true);
    if (useDelay) {
      // Small delay only for manual refresh to show loading feedback
      await Future.delayed(const Duration(milliseconds: 500));
    }
    _loadInitialData();
  }
}
