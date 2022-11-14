import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, this.image = ""});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
