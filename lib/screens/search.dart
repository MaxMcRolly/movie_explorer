import 'package:movie_explorer/imports.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchBloc = SearchBloc();

  @override
  void dispose() {
    searchBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc,
      child: Scaffold(
        backgroundColor: Color(0xff232325),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff232325),
          title: Text(
            'Movie Explorer',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color(0xff454547),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onChanged: (query) {
                  searchBloc.performSearch(query);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: 'Search for movies...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitialState) {
                    return Container();
                  } else if (state is SearchLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  } else if (state is SearchResultsState) {
                    final searchResults = state.searchResults;

                    return ListView.builder(
                      cacheExtent: 5000,
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = searchResults[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 8, right: 8),
                          child: MovieResultCard(
                            movie: movie,
                          ),
                        );
                      },
                    );
                  } else if (state is SearchErrorState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
