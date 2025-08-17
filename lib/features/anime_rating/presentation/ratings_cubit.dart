import 'package:bloc/bloc.dart';
import 'package:compendium/features/anime_rating/presentation/ratings_state.dart';
import 'package:compendium/features/anime_rating/data/rating_repository_interface.dart';
import 'package:compendium/features/anime_rating/data/rating_repository.dart';
import 'package:compendium/features/anime_rating/models/anime_rating_model.dart';

class RatingsCubit extends Cubit<RatingsState> {
  final RatingRepositoryInterface repository;
  final Map<int, int> _inflightRequestId = {};
  final Map<int, int> _snapshotPreviousRating = {};

  /// If no repository is provided, the cubit instantiates the default
  /// `RatingRepository` implementation. This keeps the view simple while
  /// allowing tests to inject a fake implementation.
  RatingsCubit([RatingRepositoryInterface? repository])
      : repository = repository ?? RatingRepository(),
        super(RatingsState.initial()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
  emit(RatingsState.loading());
    try {
      final items = await repository.loadInitial();
      emit(RatingsState.loaded(items: items));
    } catch (e) {
      emit(RatingsState.error(e.toString()));
    }
  }

  Future<void> setRating(int animeId, int rating) async {
    // Create a request id so we can ignore stale responses.
    final requestId = (DateTime.now().microsecondsSinceEpoch & 0x7fffffff);
    _inflightRequestId[animeId] = requestId;

    // Read current loaded state; if not loaded, ignore
    // Only proceed if current state is loaded
    if (state is! RatingsLoaded) return;
    final loadedState = state as RatingsLoaded;
    final items = loadedState.items;
    final Set<int> currentSaving = Set<int>.from(loadedState.savingIds);

    // Optimistic update: immediately show the new rating and mark the item as saving.
    final updated = items.map((item) {
      if (item.id == animeId) return item.copyWith(rating: rating);
      return item;
    }).toList(growable: false);

    final savingIds = Set<int>.from(currentSaving)..add(animeId);
    emit(RatingsLoaded(items: List<AnimeRatingModel>.from(updated), savingIds: savingIds, errorMessage: null));

    // Snapshot previous value so we can rollback deterministically.
    final previous = items.firstWhere((i) => i.id == animeId).rating;
    _snapshotPreviousRating[animeId] = previous;

    try {
      await repository.saveRating(animeId, rating);

      // If another request for this item started after this one, ignore this success.
      if (_inflightRequestId[animeId] != requestId) return;

      // Remove snapshot and mark as no longer saving.
      _snapshotPreviousRating.remove(animeId);
      final afterSaving = Set<int>.from(savingIds)..remove(animeId);
      emit(RatingsLoaded(items: List<AnimeRatingModel>.from(updated), savingIds: afterSaving));
    } catch (e) {
      // If another request replaced this one, ignore the failure.
      if (_inflightRequestId[animeId] != requestId) return;
      // Rollback to the exact previous value we snapped earlier.
      final snapped = _snapshotPreviousRating[animeId] ?? 0;
      final rolled = updated.map((item) {
        if (item.id == animeId) return item.copyWith(rating: snapped);
        return item;
      }).toList(growable: false);

      _snapshotPreviousRating.remove(animeId);
      final afterSaving = Set<int>.from(savingIds)..remove(animeId);
      emit(RatingsLoaded(items: List<AnimeRatingModel>.from(rolled), savingIds: afterSaving, errorMessage: e.toString()));
    } finally {
      // Clear inflight token if it's still referencing this request.
      if (_inflightRequestId[animeId] == requestId) {
        _inflightRequestId.remove(animeId);
      }
    }
  }

  Future<void> resetAll() async {
    await repository.resetAll();
    if (state is! RatingsLoaded) return;
    final loadedState = state as RatingsLoaded;
    final resetItems = loadedState.items.map((item) => item.copyWith(rating: 0)).toList(growable: false);
    emit(RatingsLoaded(items: List<AnimeRatingModel>.from(resetItems), savingIds: {}));
  }
}
