# Adding Feature Routes

## Table of Contents

- [Quick Checklist](#quick-checklist)
- [Workflow](#workflow)
  - [1. Add View Import](#1-add-view-import)
  - [2. Add Route Definition](#2-add-route-definition)
  - [3. Navigation Usage](#3-navigation-usage)
- [Naming Conventions](#naming-conventions)
  - [Route Names](#route-names)
  - [Route Paths](#route-paths)
  - [Feature Sections](#feature-sections)
- [Examples](#examples)
  - [Simple Feature Route](#simple-feature-route)
  - [Complex Feature with Nested Routes](#complex-feature-with-nested-routes)

---

## Quick Checklist

### When adding a new route:

- <input type="checkbox"> Import the view file
- <input type="checkbox"> Add route in appropriate section
- <input type="checkbox"> Follow naming conventions
- <input type="checkbox"> Test navigation works
- <input type="checkbox"> Update navigation service (if feature has one)


## Workflow

### 1. **Add View Import**
First, import your new view at the top of `lib/routes/app_router.dart`:

```dart
import 'package:compendium/features/your_feature/views/your_view.dart';
```

### 2. **Add Route Definition**
Add your route in the appropriate section of the `routes` list:

**For a new feature:**
```dart
// ==========================================
// YOUR FEATURE NAME ROUTES
// Brief description of feature
// ==========================================
GoRoute(
  path: '/your-feature',
  name: 'your_feature',
  builder: (context, state) => const YourFeatureView(),
),
```

**For nested routes within a feature:**
```dart
GoRoute(
  path: '/your-feature',
  name: 'your_feature',
  builder: (context, state) => const YourFeatureView(),
  routes: [
    GoRoute(
      path: '/details/:id',
      name: 'your_feature_details',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return YourFeatureDetailsView(id: id);
      },
    ),
  ],
),
```

### 3. **Navigation Usage**
Use the route name to navigate from anywhere in your app:

```dart
// Navigate to main feature
context.goNamed('your_feature');

// Navigate with parameters
context.goNamed('your_feature_details', pathParameters: {'id': '123'});

// Navigate with path
context.go('/your-feature/details/123');
```

## Naming Conventions

### Route Names
- Use `snake_case`
- Include feature prefix: `feature_action`
- Examples: `anime_collection`, `anime_collection_details`, `movie_watchlist_add`

### Route Paths
- Use `kebab-case`
- Keep URLs readable: `/anime-collection`, `/movie-watchlist`
- Use parameters with colon: `/anime-collection/details/:animeId`

### Feature Sections
- Use clear comment headers with `=` borders
- Include brief description of the feature
- Group related routes together

## Examples

### Simple Feature Route
```dart
// ==========================================
// QUOTE GENERATOR ROUTES
// Random quote generation and history
// ==========================================
GoRoute(
  path: '/quote-generator',
  name: 'quote_generator',
  builder: (context, state) => const QuoteGeneratorView(),
),

GoRoute(
  path: '/quote-generator/history',
  name: 'quote_generator_history',
  builder: (context, state) => const QuoteHistoryView(),
),
```

### Complex Feature with Nested Routes
```dart
// ==========================================
// MOVIE WATCHLIST ROUTES
// Movie tracking and management
// ==========================================
GoRoute(
  path: '/movie-watchlist',
  name: 'movie_watchlist',
  builder: (context, state) => const MovieWatchlistView(),
  routes: [
    GoRoute(
      path: '/movie/:movieId',
      name: 'movie_watchlist_details',
      builder: (context, state) {
        final movieId = state.pathParameters['movieId']!;
        return MovieDetailsView(movieId: movieId);
      },
    ),
    GoRoute(
      path: '/add',
      name: 'movie_watchlist_add',
      builder: (context, state) => const AddMovieView(),
    ),
    GoRoute(
      path: '/search',
      name: 'movie_watchlist_search',
      builder: (context, state) => const MovieSearchView(),
    ),
  ],
),
```
