import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/data/model/movie_model.dart';
import 'package:movieapp/provider/movie_provider.dart';

class MovieDetails extends ConsumerStatefulWidget {
  const MovieDetails({super.key});

  @override
  ConsumerState<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends ConsumerState<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 5, 29),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 17, 5, 29),
          title: const Text("Movie Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ))),
      body: Consumer(
        builder: (context, ref, child) {
          //get screen width with media query
          final screenwidth = MediaQuery.of(context).size.width;

          //get movieid from provider
          final movieId = ref.watch(movieProvider).movieId;
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 400,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(
                                    movieList[movieId].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Column(children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Icon(
                                          Icons.camera_enhance,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Genre",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          movieList[movieId].category,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )
                                      ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Column(children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Icon(
                                          Icons.timer,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Duration",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          movieList[movieId].duration,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )
                                      ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Column(children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Rating",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${movieList[movieId].rating}/10",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )
                                      ]),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            movieList[movieId].name,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 50,
                            color: Colors.grey,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              movieList[movieId].description,
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      width: (screenwidth / 2) + 100,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Reservation",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
