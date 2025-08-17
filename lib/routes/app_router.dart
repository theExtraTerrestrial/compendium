import 'package:compendium/features/anime_rating/viewmodels/anime_ratings_viewmodel.dart';
import 'package:compendium/features/anime_rating/views/anime_ratings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:compendium/features/home/views/home_view.dart';
import 'package:compendium/features/home/views/project_detail_view.dart';
import 'package:compendium/features/anime_collection/views/anime_collection_view.dart';
import 'package:compendium/features/anime_collection/viewmodels/anime_collection_viewmodel.dart';
import 'package:compendium/routes/feature_config.dart';


/// Main application router
/// All routes are defined here for simplicity and performance
final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    // ==========================================
    // HOME FEATURE ROUTES
    // Main dashboard and project detail views
    // ==========================================
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeView(),
      routes: _featureRoutes,
    )
  ],

  // Global error handling
  errorBuilder: (context, state) => _errorPageBuilder(context, state),
);

final List<FeatureConfig> _features = [
  FeatureConfig(
    id: '1',
    name: 'anime_collection',
    path: 'anime-collection',
    builder: (context, state) {
      return ChangeNotifierProvider<AnimeCollectionViewModel>(
        create: (_) => AnimeCollectionViewModel(),
        child: const AnimeCollectionView(),
      );
    },
  ),

  FeatureConfig(
    id: '2',
    name: 'anime_ratings',
    path: 'anime-ratings',
    builder: (context, state) {
      return ChangeNotifierProvider<AnimeRatingsViewModel>(
        create: (_) => AnimeRatingsViewModel(),
        child: const AnimeRatingsView(),
      );
    },
  )
];

final List<GoRoute> _featureRoutes = [
  GoRoute(
    path: 'project/:id',
    name: 'project_detail',
    builder: (context, state) {
      final projectId = state.pathParameters['id']!;
      return ProjectDetailView(projectId: projectId);
    },
    routes: <GoRoute>[
      GoRoute(
        path: 'start',
        name: 'project_start',
        builder: (context, state) {
          final projectId = state.pathParameters['id']!;
          return _findProjectById(context, projectId);
        },
      )
    ]
  ),

  ..._buildFeatureRoutes(),
];

List<GoRoute> _buildFeatureRoutes() {
  return _features.map((feature) {
    return GoRoute(
      path: feature.path,
      name: feature.name,
      builder: feature.builder,
      routes: feature.routes,
    );
  }).toList();
}

Widget _findProjectById(BuildContext context, String id) {
  try {
    FeatureConfig feature = _features.firstWhere(
      (f) => f.id == id,
    );

    // Get current state from context if available
    final currentState = GoRouterState.of(context);

    return feature.builder(context, currentState);
  } catch (e) {
    // Feature not found, return empty scaffold
    return Scaffold(
      appBar: AppBar(title: const Text('Project Not Found')),
      body: const Center(child: Text('Project not found')),
    );
  }
}

/// Global error page builder
Widget _errorPageBuilder(BuildContext context, GoRouterState state) {
  return Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Route not found: ${state.uri}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/home'),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  );
}
