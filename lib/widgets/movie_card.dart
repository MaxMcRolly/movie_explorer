import 'package:movie_explorer/imports.dart';

class MovieResultCard extends StatelessWidget {
  MovieResultCard({
    super.key,
    required this.movie,
  });
  MovieShort movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movieId: movie.id!)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff454547),
          borderRadius: BorderRadius.circular(16),
        ),
        // height: 127,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 108,
              width: 125,
              child: FittedBox(
                child: CachedImage(url: movie.image!),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    movie.description!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
