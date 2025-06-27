# Compendium

Here's a step-by-step checklist to complete before starting your individual projects:

## Table of Contents
- [Phase 1: Project Setup & Dependencies](#phase-1-project-setup--dependencies)
- [Phase 2: Folder Structure Creation](#phase-2-folder-structure-creation)
- [Phase 3: Core Models & Data Structure](#phase-3-core-models--data-structure)
- [Phase 4: Core Services](#phase-4-core-services)
- [Phase 5: Theme & Styling](#phase-5-theme--styling)
- [Phase 6: Core ViewModels](#phase-6-core-viewmodels)
- [Phase 7: Provider Setup](#phase-7-provider-setup)
- [Phase 8: Core Widgets](#phase-8-core-widgets)
- [Phase 9: Navigation Setup](#phase-9-navigation-setup)
- [Phase 10: Home Screen Implementation](#phase-10-home-screen-implementation)
- [Phase 11: Project Template Setup](#phase-11-project-template-setup)
- [Phase 12: Data Persistence & State](#phase-12-data-persistence--state)
- [Phase 13: Polish & Error Handling](#phase-13-polish--error-handling)
- [Phase 14: Final Verification](#phase-14-final-verification)
- [Success Criteria](#success-criteria)
- [Recommended Project Structure](#recommended-project-structure)

## Phase 1: Project Setup & Dependencies
- <input type="checkbox"> Create new Flutter project: flutter create my_flutter_journey
- <input type="checkbox"> Add required dependencies to pubspec.yaml:
```yaml
    provider: ^6.0.5 (state management)
    shared_preferences: ^2.2.2 (local storage)
    go_router: ^12.0.0 (navigation - optional but recommended)
```
- <input type="checkbox"> Run `flutter pub get` to install dependencies
- <input type="checkbox"> Test that app runs with default Flutter counter app

## Phase 2: Folder Structure Creation
- <input type="checkbox"> Create `lib/core/` directory
- <input type="checkbox"> Create `lib/core/models/` directory
- <input type="checkbox"> Create `lib/core/services/` directory
- <input type="checkbox"> Create `lib/core/viewmodels/` directory
- <input type="checkbox"> Create `lib/core/widgets/` directory
- <input type="checkbox"> Create `lib/features/` directory
- <input type="checkbox"> Create `lib/features/home/` directory
- <input type="checkbox"> Create `lib/routes/` directory
- <input type="checkbox"> Create `lib/themes/` directory

## Phase 3: Core Models & Data Structure
- <input type="checkbox"> Create ProjectModel class with all required fields
- <input type="checkbox"> Create ProjectStatus enum (locked, inProgress, completed)
- <input type="checkbox"> Create UserProgress model for tracking overall progress
- <input type="checkbox"> Define list of all 10 projects with initial data
- <input type="checkbox"> Test models can be created and accessed properly

## Phase 4: Core Services
- <input type="checkbox"> Create StorageService for SharedPreferences operations
- <input type="checkbox"> Create ProjectRepository for saving/loading project data
- <input type="checkbox"> Create NavigationService for routing between projects
- <input type="checkbox"> Test that data can be saved and retrieved from device storage
- <input type="checkbox"> Create default project data initialization

## Phase 5: Theme & Styling
- <input type="checkbox"> Create AppTheme class with consistent colors/fonts
- <input type="checkbox"> Define light theme (dark theme optional for now)
- <input type="checkbox"> Create reusable text styles
- <input type="checkbox"> Test theme applies consistently across app

## Phase 6: Core ViewModels
- <input type="checkbox"> Create MainViewModel for app-wide state
- <input type="checkbox"> Create HomeViewModel for home screen logic
- <input type="checkbox"> Implement progress tracking methods
- <input type="checkbox"> Implement project completion marking
- <input type="checkbox"> Test ViewModels update UI when data changes

## Phase 7: Provider Setup
- <input type="checkbox"> Configure MultiProvider in main.dart
- <input type="checkbox"> Register all core ViewModels
- <input type="checkbox"> Test that ViewModels are accessible throughout app
- <input type="checkbox"> Verify state persists during navigation

## Phase 8: Core Widgets
- <input type="checkbox"> Create ProjectCard widget for displaying projects
- <input type="checkbox"> Create ProgressIndicator widget for completion tracking
- <input type="checkbox"> Create CustomAppBar for consistent navigation
- <input type="checkbox"> Create LoadingWidget for async operations
- <input type="checkbox"> Test widgets display correctly with sample data

## Phase 9: Navigation Setup
- <input type="checkbox"> Create AppRoutes class with all route definitions
- <input type="checkbox"> Implement route generation function
- <input type="checkbox"> Create navigation methods in NavigationService
- <input type="checkbox"> Test navigation between home and placeholder project screens
- <input type="checkbox"> Ensure back button works correctly

## Phase 10: Home Screen Implementation
- <input type="checkbox"> Create HomeView with project grid/list
- <input type="checkbox"> Implement project card tap navigation
- <input type="checkbox"> Add progress tracking display
- <input type="checkbox"> Add filtering (completed/in-progress/locked)
- <input type="checkbox"> Test all home screen functionality works

## Phase 11: Project Template Setup
- <input type="checkbox"> Create template folders for each of the 10 projects
- <input type="checkbox"> Create placeholder Views for each project
- <input type="checkbox"> Register routes for all project screens
- <input type="checkbox"> Test navigation to each placeholder screen
- <input type="checkbox"> Ensure consistent app bar and back navigation

## Phase 12: Data Persistence & State
- <input type="checkbox"> Test project completion can be marked and saved
- <input type="checkbox"> Test app remembers progress after restart
- <input type="checkbox"> Test project unlocking logic (if using locked system)
- <input type="checkbox"> Verify no data loss during navigation

## Phase 13: Polish & Error Handling
- <input type="checkbox"> Add loading states for all async operations
- <input type="checkbox"> Add error handling for storage operations
- <input type="checkbox"> Test app behavior with no internet/storage issues
- <input type="checkbox"> Add confirmation dialogs where needed
- <input type="checkbox"> Test on different screen sizes

## Phase 14: Final Verification
- <input type="checkbox"> App launches without errors
- <input type="checkbox"> All navigation works smoothly
- <input type="checkbox"> Data persists correctly
- <input type="checkbox"> UI is responsive and consistent
- <input type="checkbox"> Ready to implement first individual project

## Success Criteria:
Complete when you have:
- <input type="checkbox"> Working home screen showing all 10 projects
- <input type="checkbox"> Ability to navigate to placeholder screens for each project
- <input type="checkbox"> Progress tracking that persists between app sessions
- <input type="checkbox"> Clean, consistent UI theme throughout
- <input type="checkbox"> Proper MVVM architecture foundation

## Recommended Project Structure
```
lib/
├── core/                    # Shared across all projects
│   ├── models/
│   │   ├── project_model.dart
│   │   └── user_progress_model.dart
│   ├── services/
│   │   ├── navigation_service.dart
│   │   ├── storage_service.dart
│   │   └── theme_service.dart
│   ├── viewmodels/
│   │   └── main_viewmodel.dart
│   └── widgets/
│       ├── custom_app_bar.dart
│       └── project_card.dart
│
├── features/                # Each mini-project as a feature
│   ├── home/
│   │   ├── models/
│   │   ├── views/
│   │   │   └── home_view.dart
│   │   ├── viewmodels/
│   │   │   └── home_viewmodel.dart
│   │   └── widgets/
│   │
│   ├── anime_collection/    # Project 1
│   │   ├── models/
│   │   │   └── anime_model.dart
│   │   ├── views/
│   │   │   ├── anime_collection_view.dart
│   │   │   └── anime_detail_view.dart
│   │   ├── viewmodels/
│   │   │   └── anime_collection_viewmodel.dart
│   │   └── widgets/
│   │       └── anime_card.dart
│   │
│   ├── rating_app/          # Project 2
│   │   ├── models/
│   │   │   └── rating_model.dart
│   │   ├── views/
│   │   ├── viewmodels/
│   │   └── widgets/
│   │
│   └── daily_quotes/        # Project 3
│       ├── models/
│       ├── views/
│       ├── viewmodels/
│       └── widgets/
│
├── routes/
│   └── app_routes.dart
├── themes/
│   └── app_theme.dart
└── main.dart
```
