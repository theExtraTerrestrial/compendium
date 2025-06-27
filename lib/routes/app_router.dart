import 'package:go_router/go_router.dart';
import 'package:compendium/core/views/home_view.dart';
import 'package:compendium/core/views/project_detail_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/project/:id',
      name: 'project-detail',
      builder: (context, state) {
        final projectId = state.pathParameters['id']!;
        return ProjectDetailView(projectId: projectId);
      },
    ),
  ],
);
