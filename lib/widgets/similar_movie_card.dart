import 'package:movie_explorer/imports.dart';

class SimilarMovieCard extends StatefulWidget {
  SimilarMovieCard({
    super.key,
    required this.movie,
  });
  SimilarMovie movie;
  @override
  State<SimilarMovieCard> createState() => _SimilarMovieCardState();
}

class _SimilarMovieCardState extends State<SimilarMovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsScreen(movieId: widget.movie.id!)));
      },
      child: Container(
        // height: 270,
        width: 132,
        decoration: BoxDecoration(
          color: Color(0xff454547),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                CachedImage(
                  url: widget.movie.image!,
                  width: 116,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Text(
                widget.movie.title!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            if (widget.movie.rating!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    Text(widget.movie.rating!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
              )
            else
              SizedBox(
                height: 8,
              ),
          ],
        ),
      ),
    );
  }
}
