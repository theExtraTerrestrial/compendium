import 'package:provider/provider.dart' as prov;
import 'package:compendium/features/anime_collection/viewmodels/anime_collection_viewmodel.dart';
import 'package:compendium/features/anime_collection/views/anime_collection_view.dart';
import 'package:compendium/features/feature_config.dart';
import 'package:compendium/features/home/models/project_status.dart';

final FeatureConfig animeCollectionFeature = FeatureConfig(
  id: '1',
  name: 'anime_collection',
  path: 'anime-collection',
  builder: (context, state) {
    return prov.ChangeNotifierProvider<AnimeCollectionViewModel>(
      create: (_) => AnimeCollectionViewModel(),
      child: const AnimeCollectionView(),
    );
  },
  metadata: const FeatureMetadata(
    title: 'Static Anime Collection Display',
    status: ProjectStatus.completed,
    coverImagePath: 'assets/images/anime_collection.png',
    description: 'Display 20 hardcoded anime entries in a responsive grid layout\nEach card must show: title, cover image, genre, rating (1-100)\nImplement smooth scrolling with proper spacing\nCreate custom app bar with "My Anime Collection" title\nApply consistent card styling (rounded corners, shadows)\nEnsure responsive design for multiple screen sizes',
  ),
);
