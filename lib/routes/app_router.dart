import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:compendium/features/home/views/home_view.dart';
import 'package:compendium/features/home/views/project_detail_view.dart';
import 'package:compendium/features/anime_collection/views/anime_collection_view.dart';
import 'package:compendium/features/anime_collection/viewmodels/anime_collection_viewmodel.dart';

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
      routes: _featureRoutes
    )
  ],

  // Global error handling
  errorBuilder: (context, state) => _errorPageBuilder(context, state),
);

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

  // ==========================================
  // ANIME COLLECTION FEATURE ROUTES
  // Collection management with nested routes
  // ==========================================
  GoRoute(
    path: 'anime-collection',
    name: 'anime_collection',
    builder: (context, state) => ChangeNotifierProvider(
      create: (context) => AnimeCollectionViewModel(),
      child: const AnimeCollectionView(),
    )
  ),

  // ==========================================
  // FUTURE FEATURE ROUTES
  // Add new features here as they are implemented
  // ==========================================

  // TODO: Anime Rating Feature
  // GoRoute(path: '/anime-rating', name: 'anime_rating', ...)

  // TODO: Quote Generator Feature
  // GoRoute(path: '/quote-generator', name: 'quote_generator', ...)

  // TODO: Movie Watchlist Feature
  // GoRoute(path: '/movie-watchlist', name: 'movie_watchlist', ...)

  // TODO: TV Tracker Feature
  // GoRoute(path: '/tv-tracker', name: 'tv_tracker', ...)

  // TODO: Movie Night Picker Feature
  // GoRoute(path: '/movie-night-picker', name: 'movie_night_picker', ...)

  // TODO: Manga Discovery Feature
  // GoRoute(path: '/manga-discovery', name: 'manga_discovery', ...)

  // TODO: Game Discovery Feature
  // GoRoute(path: '/game-discovery', name: 'game_discovery', ...)

  // TODO: Book Club Feature
  // GoRoute(path: '/book-club', name: 'book_club', ...)

  // TODO: Character Encyclopedia Feature
  // GoRoute(path: '/character-encyclopedia', name: 'character_encyclopedia', ...)

];

Widget _findProjectById(BuildContext context, String id) {
  switch (id) {
    case '1':
      return ChangeNotifierProvider(
        create: (context) => AnimeCollectionViewModel(),
        child: const AnimeCollectionView(),
      );
    default:
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
