import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:compendium/features/anime_rating/presentation/ratings_cubit.dart';
import 'package:compendium/features/anime_rating/presentation/ratings_state.dart';
import 'package:compendium/features/anime_rating/widgets/anime_rating_list.dart';

/// Consolidated Anime Ratings view that provides the Cubit and renders UI.
class AnimeRatingsView extends StatelessWidget {
	const AnimeRatingsView({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => RatingsCubit(),
			child: Scaffold(
				appBar: AppBar(title: const Text('Anime Ratings'), centerTitle: true),
						body: BlocBuilder<RatingsCubit, RatingsState>(
							builder: (context, state) {
								return state.when(
									loading: () => const Center(child: CircularProgressIndicator()),
									loaded: (items, savingIds, errorMessage) {
										final rated = items.where((i) => i.rating > 0).toList();
										double average = 0.0;
										if (rated.isNotEmpty) {
											final sum = rated.map((e) => e.rating).reduce((a, b) => a + b);
											average = sum / rated.length;
										}
										return AnimeRatingList(
											isLoading: false,
											errorMessage: errorMessage,
											items: items,
											average: average,
											savingIds: savingIds,
											onRate: (id, r) => context.read<RatingsCubit>().setRating(id, r),
											onReset: () => context.read<RatingsCubit>().resetAll(),
										);
									},
									error: (message) => Center(
										child: Column(
											mainAxisSize: MainAxisSize.min,
											children: [
												Text(message),
												const SizedBox(height: 8),
												ElevatedButton(
													onPressed: () => context.read<RatingsCubit>().loadInitial(),
													child: const Text('Retry'),
												),
											],
										),
									),
								);
							},
						),
			),
		);
	}
}
