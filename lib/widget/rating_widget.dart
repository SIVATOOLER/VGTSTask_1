import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: rating >= 1 ? Colors.amber : Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: rating >= 2 ? Colors.amber : Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: rating >= 3 ? Colors.amber : Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: rating >= 4 ? Colors.amber : Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: rating >= 5 ? Colors.amber : Colors.grey,
          size: 15,
        ),
      ],
    );
  }
}
