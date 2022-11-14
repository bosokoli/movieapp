class Movies {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final String duration;
  final String rating;
  Movies(
      {required this.id,
      required this.name,
      required this.category,
      required this.image,
      required this.description,
      required this.rating,
      required this.duration});
}

final List<Movies> movieList = [
  Movies(
    id: "1",
    name: "Me Time",
    category: "comedy",
    image: "lib/assets/images/me_time.png",
    rating: "5.0",
    description: "",
    duration: "1h 41m",
  ),
  Movies(
    id: "2",
    name: "Wakanda Forever",
    category: "Thriller",
    rating: "5.0",
    description: "",
    duration: "1h 41m",
    image: "lib/assets/images/wakanda.png",
  ),
  Movies(
      id: "3",
      name: "Avatar",
      category: "Thriller",
      rating: "5.0",
      description: "",
      duration: "1h 41m",
      image: "lib/assets/images/avatar.png"),
  Movies(
    id: "4",
    name: "Manifest",
    category: "sci-fi",
    rating: "5.0",
    description: "",
    duration: "1h 41m",
    image: "lib/assets/images/manifest.png",
  ),
];
