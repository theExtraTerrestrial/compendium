import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {

  final int rating;
  final int itemCount;
  final int itemSize;
  final IconData filledIcon;
  final IconData outlinedIcon;
  final MaterialColor color;

  const StarRating({
    required this.rating,
    this.itemCount = 5,
    this.itemSize = 20,
    this.color = Colors.amber,
    this.filledIcon = Icons.star,
    this.outlinedIcon = Icons.star_border,
    super.key
  });


  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    void setRating(int newRating) {
      setState(() {
        _rating = newRating;
      });
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.itemCount, (index) {
        return GestureDetector(
          onTap: () {
            _rating == index + 1
                ? setRating(0)
                : setRating(index + 1);
          },
          child: Icon(
            index < _rating ? widget.filledIcon : widget.outlinedIcon,
            size: widget.itemSize.toDouble(),
            color: widget.color,
          ),
        );
      }),
    );
  }
}
