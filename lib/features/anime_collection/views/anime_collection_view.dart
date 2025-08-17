import 'package:compendium/core/models/anime_model.dart';
import 'package:compendium/features/anime_collection/viewmodels/anime_collection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AnimeCollectionView extends StatefulWidget {
  const AnimeCollectionView({super.key});

  @override
  State<AnimeCollectionView> createState() => _AnimeCollectionViewState();
}

class _AnimeCollectionViewState extends State<AnimeCollectionView> {
  @override
  void initState() {
    super.initState();
    // Trigger initial data loading after the widget is built
    // addPostFrameCallback prevents potential issues with rebuilds during initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<AnimeCollectionViewModel>(context, listen: false);
      viewModel.refreshCollection(useDelay: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<AnimeCollectionViewModel>(
      builder: (context, viewModel, child) {
        // Handle loading state
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Handle error state
        if (viewModel.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(viewModel.errorMessage ?? 'An error occurred'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.refreshCollection(useDelay: true),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Handle empty state
        if (!viewModel.hasAnime) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.downloading_rounded, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text('No anime in collection'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.refreshCollection(useDelay: true),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Render the anime grid with SliverAppBar
        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            final screenHeight = MediaQuery.of(context).size.height;
            final crossAxisCount = (screenWidth / 300).floor().clamp(1, 5);
            const childAspectRatio = 0.7; // Card width to height ratio

            // Scale cache extent based on both screen dimensions for optimal grid performance
            // Factor in actual card dimensions and screen size for better caching
            final estimatedCardHeight = (screenWidth / crossAxisCount) / childAspectRatio;
            final screenFactor = (screenHeight / 1000).clamp(0.6, 1.4);
            final cacheExtent = (estimatedCardHeight * 2 * screenFactor).clamp(600.0, 1500.0);

            return CustomScrollView(
              cacheExtent: cacheExtent, // Cache items outside viewport for smooth scrolling
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'My Anime Collection',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                    centerTitle: true,
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final anime = viewModel.animeCollection[index];
                        return _buildAnimeCard(context, anime);
                      },
                      childCount: viewModel.animeCollection.length,
                      addAutomaticKeepAlives: true, // Keep built widgets alive
                      addRepaintBoundaries: true, // Optimize repainting
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAnimeCard(BuildContext context, AnimeModel anime) {
    return Card(
      clipBehavior: Clip.antiAlias, // Ensures image respects card's rounded corners
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCardMedia(anime),
          _buildCardContent(anime),
        ],
      ),
    );
  }

  /// Builds the top image section of the anime card
  Widget _buildCardMedia(AnimeModel anime) {
    return Expanded(
      flex: 3,
      child: Image.network(
        anime.coverImageUrl,
        fit: BoxFit.cover,
        cacheWidth: 300,
        cacheHeight: 400,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Icon(Icons.error, size: 40),
          );
        },
      ),
    );
  }

  /// Builds the content section (title and genres) of the anime card
  Widget _buildCardContent(AnimeModel anime) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Color.lerp(anime.color, Colors.white, 0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCardTitle(anime),
          const SizedBox(height: 8.0),
          _buildCardGenres(anime),
        ],
      ),
    );
  }

  /// Builds the title section
  Widget _buildCardTitle(AnimeModel anime) {
    return SizedBox(
      height: 50, // Fixed height for consistent layout
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Tooltip(
              verticalOffset: -16,
              message: anime.title,
              child: Text(
                anime.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color.lerp(anime.color, Colors.black, 0.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildCardScore(anime)
          ),
        ],
      ),
    );
  }

  /// Builds the score section
  Widget _buildCardScore(AnimeModel anime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber[700], size: 26),
            Icon(Icons.star, color: Colors.amber[500], size: 16),
          ],
        ),
        const SizedBox(width: 4),
        Text(
          anime.score.toString(),
          style: TextStyle(
            color: Color.lerp(anime.color, Colors.black, 0.6),
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  /// Builds the horizontally scrollable genres section
  Widget _buildCardGenres(AnimeModel anime) {
    return SizedBox(
      height: 32,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: anime.genres.map((genre) =>
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Chip(
                label: Text(
                  genre,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color.lerp(anime.color, Colors.black, 0.3),
                side: BorderSide(
                  color: Color.lerp(anime.color, Colors.white, 0.2)!,
                  width: 1,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
