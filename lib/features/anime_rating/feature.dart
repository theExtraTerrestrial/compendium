import 'package:compendium/features/feature_config.dart';
import 'package:compendium/features/home/models/project_status.dart';
import 'package:compendium/features/anime_rating/views/anime_ratings_view.dart';

final FeatureConfig animeRatingsFeature = FeatureConfig(
  id: '2',
  name: 'anime_ratings',
  path: 'anime-ratings',
  builder: (context, state) => const AnimeRatingsView(),
  metadata: const FeatureMetadata(
    title: 'Anime Rating System',
    status: ProjectStatus.completed,
    coverImagePath: 'assets/images/anime_rating.png',
    description: 'List of 15 pre-loaded anime titles for rating\nInteractive 1-5 star rating system per anime\nPersistent storage using SharedPreferences\nDisplay average rating across all rated anime\nVisual differentiation between rated/unrated entries\n"Reset All Ratings" functionality with confirmation dialog\nReal-time rating updates without app restart',
  ),
);
