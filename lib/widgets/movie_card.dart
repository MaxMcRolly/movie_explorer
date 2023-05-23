import 'package:movie_explorer/imports.dart';

class MovieResultCard extends StatelessWidget {
  MovieResultCard({
    super.key,
    required this.movie,
  });
  MovieShort movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            movie.image!,
            height: 40,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(movie.title!),
              Text(movie.description!),
            ],
          )
        ],
      ),
    );
  }
}
