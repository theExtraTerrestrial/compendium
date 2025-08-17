import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:compendium/features/home/views/home_view.dart';
import 'package:compendium/features/home/views/project_detail_view.dart';
import 'package:compendium/features/feature_registry.dart' as registry;
import 'package:compendium/features/feature_config.dart';

/// Feature registration list sourced from `feature_registry.dart` so both
/// the router and UI can share the same single source of truth.
final List<FeatureConfig> _features = List.unmodifiable(registry.featureRegistry);

/// Validate the feature list at startup to catch duplicate names/paths early.
void _validateFeatures(List<FeatureConfig> features) {
  final names = <String>{};
  final paths = <String>{};
  for (final f in features) {
    if (!names.add(f.name)) {
      throw StateError('Duplicate feature route name: ${f.name}');
    }
    if (!paths.add(f.path)) {
      throw StateError('Duplicate feature path: ${f.path}');
    }
  }
}

final List<GoRoute> _featureRoutes = [
  // Generic project routes for all features
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

  // Personalized routes built based on feature configurations
  ..._buildFeatureRoutes(),
];

/// Main application router
/// All routes are defined here for simplicity and performance
final GoRouter appRouter = _buildAppRouter();

GoRouter _buildAppRouter() {
  _validateFeatures(_features);
  return GoRouter(
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
}

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
