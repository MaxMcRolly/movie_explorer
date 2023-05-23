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
        appBar: AppBar(
          title: Text('Movie Search'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  searchBloc.add(PerformSearchEvent(query));
                },
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitialState) {
                    return Container();
                  } else if (state is SearchLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchResultsState) {
                    final searchResults = state.searchResults;
                    return ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = searchResults[index];
                        return MovieResultCard(
                          movie: movie,
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
