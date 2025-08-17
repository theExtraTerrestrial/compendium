import 'package:compendium/features/anime_rating/models/anime_rating_model.dart';

/// Repository interface for anime ratings and catalog data.
/// Renamed from `RatingRepository` to avoid name collision with concrete impl.
abstract class RatingRepositoryInterface {
  Future<List<AnimeRatingModel>> loadInitial();
  Future<Map<int, int>> loadAllRatings();
  Future<int?> getRating(int animeId);
  Future<void> saveRating(int animeId, int rating);
  Future<void> removeRating(int animeId);
  Future<void> resetAll();
}
