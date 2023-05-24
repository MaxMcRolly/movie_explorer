import 'package:movie_explorer/imports.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;

  MovieDetailsScreen({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232325),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff232325),
        title: Text(
          'Movie Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: FutureBuilder<MovieFull>(
        future: httpRepository.getMovieDetails(movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred while loading movie details.',
                  style: Theme.of(context).textTheme.bodyMedium),
            );
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedImage(url: movie.image!),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              if (movie.imdbRating != null)
                                Row(
                                  children: [
                                    Image.asset(
                                      "lib/assets/imdb-logo.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(movie.imdbRating!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ],
                                ),
                              SizedBox(
                                width: 12,
                              ),
                              if (movie.metacriticRating != null)
                                Row(
                                  children: [
                                    Image.asset(
                                      "lib/assets/metacritic-logo.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(movie.metacriticRating!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ],
                                )
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            '${movie.year} ${movie.runtime != null ? "| ${movie.runtime}" : ""}',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          if (movie.directors!.isNotEmpty)
                            Text(
                              'Directed by: ${movie.directors}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          SizedBox(height: 12.0),
                          Text(
                            '${movie.stars}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            movie.plot!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Actors',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            height: 300.0,
                            child: ListView.builder(
                              cacheExtent: 5000,
                              scrollDirection: Axis.horizontal,
                              itemCount: movie.actors.length,
                              itemBuilder: (context, index) {
                                final actor = movie.actors[index];

                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ActorCard(actor: actor),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 16.0),
                          if (movie.similarMovies.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Similar Movies',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 8.0),
                                Container(
                                  height: 270.0,
                                  child: ListView.builder(
                                    cacheExtent: 5000,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movie.similarMovies.length,
                                    itemBuilder: (context, index) {
                                      final similarMovie =
                                          movie.similarMovies[index];

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SimilarMovieCard(
                                            movie: similarMovie),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
