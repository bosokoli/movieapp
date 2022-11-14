import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/data/model/movie_model.dart';
import 'package:movieapp/movie_details.dart';
import 'package:movieapp/provider/movie_provider.dart';
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
    //controller for page view
    _controller =
        PageController(viewportFraction: 0.7, initialPage: _currentPage);

    // move cards every 5 seconds
    animator = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      _controller.animateToPage(nextIndex,
          duration: const Duration(seconds: 1), curve: Curves.ease);
      nextIndex++;

      //reset view to first card after last view
      if (nextIndex == movieList.length) {
        nextIndex = 0;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //Page view for carousel
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
                // container for active card indicator
                return Transform.scale(
                  scale: 1.5,
                  //container for active card indicator
                  child: Container(
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                );
              }
              //scale circular avatar
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
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;
        if (_controller.position.haveDimensions) {
          //get value for the rotation angle to rotate inactive cards
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.048).clamp(-1, 1);
        }

        return Transform.rotate(
          //multiply value witn pi to get rotaton angle
          angle: pi * value,
          child: InkWell(
            onTap: () {
              //update movieid with index value
              ref.watch(movieProvider).movieId = index;

              //push to movie details screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MovieDetails()));
            },
            child: MovieCard(
              image: movieList[index].image,
            ),
          ),
        );
      },
    );
  }
}
