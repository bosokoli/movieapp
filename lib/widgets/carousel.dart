import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/data/model/movie_model.dart';
import 'package:movieapp/widgets/movie_card.dart';

class MovieCarousel extends ConsumerStatefulWidget {
  const MovieCarousel({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends ConsumerState<MovieCarousel> {
  ValueNotifier<int> activePage = ValueNotifier<int>(0);
  int nextIndex = 1;
  int previousIndex = 0;
  final int _currentPage = 1;
  late PageController _controller;

  dynamic animator;
  @override
  void initState() {
    super.initState();
    _controller =
        PageController(viewportFraction: 0.7, initialPage: _currentPage);
    animator = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      _controller.animateToPage(nextIndex,
          duration: const Duration(seconds: 1), curve: Curves.ease);
      nextIndex++;
      previousIndex = nextIndex - 2;
      if (nextIndex == movieList.length) {
        nextIndex = 0;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 320,
            child: PageView.builder(
              onPageChanged: ((value) {
                setState(() {
                  activePage.value = value;
                });
              }),
              controller: _controller,
              itemCount: movieList.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return carouselView(index);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: movieList.length,
              itemBuilder: ((context, index) {
                if (activePage.value == index) {
                  return Transform.scale(
                    scale: 1.5,
                    child: Container(
                      width: 30,
                      height: 2,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  );
                }
                return Transform.scale(
                  scale: 1.5,
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey,
                  ),
                );
              }),
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;
        if (_controller.position.haveDimensions) {
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.048).clamp(-1, 1);
        }

        return Transform.rotate(
          angle: pi * value,
          child: MovieCard(
            image: movieList[index].image,
          ),
        );
      },
    );
  }
}
