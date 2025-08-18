import 'package:flutter/material.dart';
import 'package:compendium/features/anime_rating/models/anime_rating_model.dart';
import 'package:compendium/core/widgets/star_rating.dart';

class AnimeRatingList extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final List<AnimeRatingModel> items;
  final double average;
  final Set<int> savingIds;
  final void Function(int animeId, int rating) onRate;
  final VoidCallback onReset;

  const AnimeRatingList({
    required this.isLoading,
    this.errorMessage,
    required this.items,
    required this.average,
    required this.savingIds,
    required this.onRate,
    required this.onReset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (errorMessage != null) return Center(child: Text(errorMessage!));
    if (items.isEmpty) return const Center(child: Text('No anime in collection'));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Average: ${average.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
              TextButton(onPressed: onReset, child: const Text('Reset All'))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final anime = items[index];
              final isSaving = savingIds.contains(anime.id);
              return ListTile(
                tileColor: anime.rating > 0 ? Colors.indigo[50] : null,
                leading: CircleAvatar(backgroundImage: NetworkImage(anime.coverImageUrl)),
                title: Text(anime.title),
                subtitle: StarRating(
                  rating: anime.rating,
                  onRatingChanged: (r) => onRate(anime.id, r),
                ),
                trailing: isSaving ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)) : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
