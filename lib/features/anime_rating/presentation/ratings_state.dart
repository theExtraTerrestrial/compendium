import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:compendium/features/anime_rating/models/anime_rating_model.dart';

part 'ratings_state.freezed.dart';

@freezed
class RatingsState with _$RatingsState {
  const factory RatingsState.loading() = RatingsLoading;

  const factory RatingsState.loaded({
    required List<AnimeRatingModel> items,
    @Default(<int>{}) Set<int> savingIds,
    String? errorMessage,
  }) = RatingsLoaded;

  const factory RatingsState.error(String message) = RatingsError;

  factory RatingsState.initial() => const RatingsState.loading();
}
