import 'package:movie_explorer/imports.dart';

abstract class SearchEvent {}

class PerformSearchEvent extends SearchEvent {
  final String query;

  PerformSearchEvent(this.query);
}

// Bloc
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is PerformSearchEvent) {
      yield SearchLoadingState();

      try {
        final results = await httpRepository.searchMovies(event.query);
        yield SearchResultsState(results);
      } catch (error) {
        yield SearchErrorState('Error searching movies');
      }
    }
  }
}

// Bloc state
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchResultsState extends SearchState {
  final List<MovieShort> searchResults;

  SearchResultsState(this.searchResults);
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);
}
