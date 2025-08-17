import 'package:compendium/core/widgets/star_rating.dart';
import 'package:compendium/features/anime_rating/viewmodels/anime_ratings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeRatingsView extends StatefulWidget {
  const AnimeRatingsView({super.key});

  @override
  State<AnimeRatingsView> createState() => _AnimeRatingsViewState();
}

class _AnimeRatingsViewState extends State<AnimeRatingsView> {

  @override
  void initState() {
    super.initState();
    // Use post-frame callback to ensure the widget tree is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final viewModel = Provider.of<AnimeRatingsViewModel>(context, listen: false);
        viewModel.loadInitialRatings();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Ratings'),
        centerTitle: true,
      ),
      body: Consumer<AnimeRatingsViewModel>(
        builder: (context, viewModel, child) {
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
                ],
              ),
            );
          }

          // Handle empty state
          if (viewModel.animeRatings.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.downloading_rounded, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No anime in collection')
                ],
              ),
            );
          }

          // Display the list of anime ratings
          return _renderAnimeRatingsList(viewModel);
        },
      ),
    );
  }

  Widget _renderAnimeRatingsList(AnimeRatingsViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.animeRatings.length,
      itemBuilder: (context, index) {
        final anime = viewModel.animeRatings[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(anime.coverImageUrl ?? ''),
          ),
          title: Text(anime.title ?? 'Unknown Title'),
          subtitle: StarRating(
            rating: anime.rating
          ),
        );
      }
    );
  }
}
