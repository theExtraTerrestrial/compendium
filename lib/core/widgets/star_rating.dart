import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // 0..itemCount
  final int itemCount;
  final int itemSize;
  final IconData filledIcon;
  final IconData outlinedIcon;
  final MaterialColor color;
  final ValueChanged<int>? onRatingChanged;

  const StarRating({
    required this.rating,
    this.itemCount = 5,
    this.itemSize = 20,
    this.color = Colors.amber,
    this.filledIcon = Icons.star,
    this.outlinedIcon = Icons.star_border,
    this.onRatingChanged,
    super.key,
  });

  int _clamp(int value) => value.clamp(0, itemCount);

  @override
  Widget build(BuildContext context) {
    final clamped = _clamp(rating);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < itemCount; i++)
          GestureDetector(
            onTap: onRatingChanged == null
                ? null
                : () {
                    final newRating = (clamped == i + 1) ? 0 : i + 1;
                    onRatingChanged!(newRating);
                  },
            child: Icon(
              i < clamped ? filledIcon : outlinedIcon,
              size: itemSize.toDouble(),
              color: color,
            ),
          ),
        const SizedBox(width: 6),
        Text(
          ' ($clamped/$itemCount)',
          style: TextStyle(fontSize: itemSize * 0.8),
        ),
      ],
    );
  }
}
