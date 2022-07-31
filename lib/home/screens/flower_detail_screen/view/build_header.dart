
import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  final Flower flower;

  const BuildHeader({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Hero(
            tag: flower.title,
            child: Image.network(
              flower.photoURL,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                flower.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
