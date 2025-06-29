# Flutter Learning Compendium - Project Requirements

**Timeline:** 10 Progressive Projects
**Architecture:** MVVM Pattern Required

---

## Project 1: Static Anime Collection Display

### Requirements:
- Display 20 hardcoded anime entries in a responsive grid layout
- Each card must show: title, cover image, genre, rating (1-100)
- Implement smooth scrolling with proper spacing
- Create custom app bar with "My Anime Collection" title
- Apply consistent card styling (rounded corners, shadows)
- Ensure responsive design for multiple screen sizes

### Compendium Integration:
- **Team Lead Note:** *"Start with basic home screen showing all 10 projects as cards. Implement simple navigation to this anime project. Focus on getting the MVVM structure right from day one - don't worry about fancy features yet."*

**Deliverables:** Working anime grid + basic compendium home screen with navigation

### Documentation Links:
**Core Widgets:**
- [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html) - Grid layout for anime cards
- [Card](https://api.flutter.dev/flutter/material/Card-class.html) - Material card design
- [Container](https://api.flutter.dev/flutter/widgets/Container-class.html) - Styling and spacing
- [Image.network](https://api.flutter.dev/flutter/widgets/Image-class.html) - Loading cover images
- [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) - Custom app bar
- [Column/Row](https://api.flutter.dev/flutter/widgets/Column-class.html) - Layout widgets

**Styling:**
- [BoxDecoration](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html) - Rounded corners and shadows
- [EdgeInsets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html) - Padding and margins

---

## Project 2: Anime Rating System

### Requirements:
- List of 15 pre-loaded anime titles for rating
- Interactive 1-5 star rating system per anime
- Persistent storage using SharedPreferences
- Display average rating across all rated anime
- Visual differentiation between rated/unrated entries
- "Reset All Ratings" functionality with confirmation dialog
- Real-time rating updates without app restart

### Compendium Integration:
- **Team Lead Note:** *"Now add project completion tracking. When they finish this rating app, mark Project 2 as 'completed' and show a progress bar on the home screen. Add a simple UserProgress model to track completion percentages."*

**Deliverables:** Rating system + completion tracking + progress visualization

### Documentation Links:
**Widgets:**
- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html) - Anime list display
- [GestureDetector](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) - Tap handling
- [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html) - Star rating display
- [AlertDialog](https://api.flutter.dev/flutter/material/AlertDialog-class.html) - Reset confirmation

**State & Storage:**
- [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) - Managing rating state
- [SharedPreferences](https://pub.dev/packages/shared_preferences) - Data persistence
- [Provider](https://pub.dev/packages/provider) - MVVM state management

---

## Project 3: Daily Anime Quote Generator

### Requirements:
- Database of 50+ anime character quotes
- Single daily quote that changes at midnight
- "Favorite Quote" functionality with local persistence
- Dedicated favorites screen showing saved quotes
- Quote history showing last 7 days of displayed quotes
- Character attribution and source anime display
- Clean typography with proper text hierarchy

### Compendium Integration:
- **Team Lead Note:** *"Implement streak tracking for the compendium. Track daily app usage and show current streak on home screen. This teaches date handling which they'll need for the final anime discovery app. Add 'last active' timestamp to user progress."*

**Deliverables:** Daily quote system + streak tracking + activity monitoring

### Documentation Links:
**Date & Time:**
- [DateTime](https://api.dart.dev/stable/dart-core/DateTime-class.html) - Date handling
- [Timer](https://api.dart.dev/stable/dart-async/Timer-class.html) - Daily updates

**Navigation:**
- [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html) - Screen navigation
- [MaterialPageRoute](https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html) - Page routing

**UI:**
- [Text](https://api.flutter.dev/flutter/widgets/Text-class.html) - Typography styling
- [FloatingActionButton](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html) - Favorite button

---

## Project 4: Movie Watchlist Manager

### Requirements:
- Manual movie entry (title, year, genre, poster URL input)
- Three status categories: "Want to Watch", "Watching", "Completed"
- Drag-and-drop or button-based status transitions
- Search and filter functionality by title/genre
- Movie deletion with confirmation dialogs
- Category counters and progress statistics
- Export watchlist to shareable text format
- Full data persistence between sessions

### Compendium Integration:
- **Team Lead Note:** *"Add project filtering to the compendium home screen. Users should be able to filter projects by status (completed/in-progress/not-started). Also implement project cards with preview screenshots. This teaches list management which mirrors their final anime list app."*

**Deliverables:** Watchlist app + enhanced compendium filtering + project previews

### Documentation Links:
**Forms & Input:**
- [TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html) - Movie entry forms
- [DropdownButton](https://api.flutter.dev/flutter/material/DropdownButton-class.html) - Genre selection
- [Form](https://api.flutter.dev/flutter/widgets/Form-class.html) - Form validation

**List Management:**
- [Dismissible](https://api.flutter.dev/flutter/widgets/Dismissible-class.html) - Swipe to delete
- [DragTarget](https://api.flutter.dev/flutter/widgets/DragTarget-class.html) - Drag and drop
- [SearchDelegate](https://api.flutter.dev/flutter/material/SearchDelegate-class.html) - Search functionality

---

## Project 5: TV Show Episode Tracker

### Requirements:
- Multi-level data structure (Shows → Seasons → Episodes)
- Individual episode check-off functionality
- Season and show-level progress bars
- Episode detail views (title, air date, synopsis)
- "Next Episode to Watch" recommendation system
- Comprehensive statistics dashboard (total episodes, viewing time)
- Data backup and restore functionality
- Progress visualization charts

### Compendium Integration:
- **Team Lead Note:** *"Implement skill badges for the compendium. As they complete projects, unlock skill badges like 'State Management Master', 'Navigation Expert', etc. Create a skills showcase screen. This reinforces learning outcomes and provides motivation."*

**Deliverables:** Episode tracker + skill badge system + achievements

### Documentation Links:
**Complex Layouts:**
- [ExpansionTile](https://api.flutter.dev/flutter/material/ExpansionTile-class.html) - Collapsible seasons
- [LinearProgressIndicator](https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html) - Progress bars
- [Checkbox](https://api.flutter.dev/flutter/material/Checkbox-class.html) - Episode completion

**Data Visualization:**
- [fl_chart](https://pub.dev/packages/fl_chart) - Progress charts
- [TabBar](https://api.flutter.dev/flutter/material/TabBar-class.html) - Statistics tabs

---

## Project 6: Random Movie Night Picker

### Requirements:
- Personal movie collection (minimum 30 entries)
- Animated random selection with suspense build-up
- Advanced filtering (exclude genres, ratings, runtime)
- "Not Tonight" temporary exclusion feature
- Comprehensive selection history (last 10 picks with dates)
- "Surprise Me" mode bypassing all filters
- Watched/unwatched status tracking
- Customizable filter preferences page

### Compendium Integration:
- **Team Lead Note:** *"This is essentially a prototype of their final anime app! Add time tracking to the compendium - track how long they spend on each project. Create a statistics dashboard showing learning time, most worked-on projects, etc. This teaches the random selection algorithms they'll need."*

**Deliverables:** Random picker + time tracking + learning analytics dashboard

### Documentation Links:
**Animation:**
- [AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html) - Selection animation
- [Tween](https://api.flutter.dev/flutter/animation/Tween-class.html) - Animation values
- [AnimatedBuilder](https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html) - Animation widgets

**Advanced UI:**
- [Chip](https://api.flutter.dev/flutter/material/Chip-class.html) - Filter tags
- [Switch](https://api.flutter.dev/flutter/material/Switch-class.html) - Settings toggles

---

## Project 7: Manga Discovery Engine

### Requirements:
- Integration with MangaDex or similar public API
- Infinite scroll pagination (20 items per page)
- Real-time search with debouncing
- Detailed manga pages (synopsis, chapters, tags, ratings)
- Personal "Plan to Read" collection with local storage
- Offline caching for previously viewed content
- Comprehensive error handling and retry mechanisms
- Pull-to-refresh functionality
- Loading states for all async operations

### Compendium Integration:
- **Team Lead Note:** *"Add data export/import to the compendium. Users should be able to export their entire learning progress and import it on another device. This teaches JSON serialization and file handling. Also add a 'learning path' visualization showing their journey through projects."*

**Deliverables:** API integration + data export/import + learning path visualization

### Documentation Links:
**HTTP & API:**
- [http](https://pub.dev/packages/http) - API requests
- [FutureBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html) - Async data loading
- [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) - Real-time updates

**Performance:**
- [cached_network_image](https://pub.dev/packages/cached_network_image) - Image caching
- [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) - Infinite scroll

**Loading States:**
- [CircularProgressIndicator](https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html) - Loading spinner
- [RefreshIndicator](https://api.flutter.dev/flutter/material/RefreshIndicator-class.html) - Pull to refresh

---

## Project 8: Game Discovery Platform

### Requirements:
- RAWG API integration for game data
- Multi-parameter filtering (platform, genre, release year, rating)
- Detailed game pages (screenshots, descriptions, Metacritic scores)
- Personal game collections ("Owned", "Wishlist", "Completed")
- Daily featured game with automatic rotation
- Advanced search with multiple simultaneous filters
- Image caching for optimal performance
- System share sheet integration for recommendations
- Offline mode displaying cached content
- API rate limiting and key management

### Compendium Integration:
- **Team Lead Note:** *"Implement user settings for the compendium. Theme selection, notification preferences, data management options. Create a comprehensive settings screen. This teaches advanced state management and user customization."*

**Deliverables:** Game discovery app + comprehensive settings system + theme management

### Documentation Links:
**Advanced Networking:**
- [dio](https://pub.dev/packages/dio) - Advanced HTTP client
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) - Network status

**UI Components:**
- [CarouselSlider](https://pub.dev/packages/carousel_slider) - Image galleries
- [share_plus](https://pub.dev/packages/share_plus) - System sharing

**State Management:**
- [riverpod](https://pub.dev/packages/riverpod) - Advanced state management (alternative to Provider)

---

## Project 9: Social Book Club Manager

### Requirements:
- User authentication (email/password + Google Sign-In)
- Cloud data synchronization across devices
- Book club creation and management with invite codes
- Personalized daily reading recommendations per member
- Democratic voting system for next book selections
- Reading progress tracking with personal notes
- Threaded discussion system per book
- Push notification system for club activities
- Administrative controls for club moderators
- PDF export of reading history and statistics

### Compendium Integration:
- **Team Lead Note:** *"Add social sharing to the compendium. Users should be able to share their progress, completed projects, and achievements on social media. Create shareable progress cards with attractive designs. This teaches advanced UI design and system integrations."*

**Deliverables:** Social book app + social sharing features + advanced UI components

### Documentation Links:
**Authentication:**
- [firebase_auth](https://pub.dev/packages/firebase_auth) - User authentication
- [google_sign_in](https://pub.dev/packages/google_sign_in) - Google Sign-In

**Cloud Storage:**
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) - Cloud database
- [firebase_core](https://pub.dev/packages/firebase_core) - Firebase setup

**Notifications:**
- [firebase_messaging](https://pub.dev/packages/firebase_messaging) - Push notifications
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) - Local notifications

**File Operations:**
- [pdf](https://pub.dev/packages/pdf) - PDF generation
- [path_provider](https://pub.dev/packages/path_provider) - File system access

---

## Project 10: Anime Character Encyclopedia

### Requirements:
- Comprehensive database of 200+ anime characters
- Daily character reveal system (exactly one per day at midnight)
- Rich character detail pages (name, series, biography, stats, relationships)
- Complete character gallery with search and filtering
- Interactive calendar showing reveal history
- Personal favorites collection with custom organization
- Character comparison tool with side-by-side statistics
- Search functionality limited to previously revealed characters
- Consecutive day streak tracking with rewards
- Social media sharing with custom character cards
- Customizable notification scheduling
- Advanced statistics and user engagement metrics

### Compendium Integration:
- **Team Lead Note:** *"Final polish phase! Add advanced analytics to the compendium - learning velocity, skill progression graphs, project completion predictions. Create a beautiful portfolio export feature showing their entire Flutter journey. This prepares them for building their actual AniList anime discovery app."*

**Deliverables:** Character encyclopedia + advanced analytics + portfolio showcase

### Documentation Links:
**Calendar & Scheduling:**
- [table_calendar](https://pub.dev/packages/table_calendar) - Calendar widget
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) - Custom notifications

**Advanced UI:**
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view) - Advanced grid layouts
- [photo_view](https://pub.dev/packages/photo_view) - Image zoom functionality

**Analytics:**
- [charts_flutter](https://pub.dev/packages/charts_flutter) - Data visualization
- [syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts) - Professional charts

**Social Features:**
- [social_media_recorder](https://pub.dev/packages/social_media_recorder) - Social sharing
- [screenshot](https://pub.dev/packages/screenshot) - Generate shareable images

---

## Success Metrics:
- **Technical:** All projects demonstrate proper MVVM architecture
- **Functionality:** Each project meets 100% of specified requirements
- **Integration:** Compendium evolves with each project completion
- **Learning:** Progressive skill building toward final anime discovery app
- **Quality:** Clean, maintainable code ready for production

## Final Outcome:
Upon completion, developer will have mastered all technical skills required for the AniList anime discovery application, plus a comprehensive portfolio demonstrating Flutter expertise.

## General Documentation Resources

**Architecture:**
- [Provider Pattern Guide](https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple) - MVVM implementation
- [App Architecture Guide](https://docs.flutter.dev/development/data-and-backend/state-mgmt/options) - State management patterns

**Testing:**
- [Flutter Testing Guide](https://docs.flutter.dev/testing) - Unit and widget testing
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests) - End-to-end testing

**Performance:**
- [Performance Best Practices](https://docs.flutter.dev/perf/best-practices) - Optimization tips
- [Memory Management](https://docs.flutter.dev/perf/memory) - Memory optimization
