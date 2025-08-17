import 'package:compendium/features/feature_config.dart';
import 'package:compendium/features/anime_collection/feature.dart';
import 'package:compendium/features/anime_rating/feature.dart';
import 'package:compendium/features/daily_quote/feature.dart';
import 'package:compendium/features/movie_watchlist/feature.dart';
import 'package:compendium/features/episode_tracker/feature.dart';
import 'package:compendium/features/random_picker/feature.dart';
import 'package:compendium/features/manga_discovery/feature.dart';
import 'package:compendium/features/game_discovery/feature.dart';
import 'package:compendium/features/book_club/feature.dart';
import 'package:compendium/features/character_encyclopedia/feature.dart';

/// Central registry of feature configs used by both the router and UI.
final List<FeatureConfig> featureRegistry = [
  animeCollectionFeature,
  animeRatingsFeature,
  dailyQuoteFeature,
  movieWatchlistFeature,
  episodeTrackerFeature,
  randomPickerFeature,
  mangaDiscoveryFeature,
  gameDiscoveryFeature,
  bookClubFeature,
  characterEncyclopediaFeature,
];
