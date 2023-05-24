import 'package:movie_explorer/imports.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

abstract class SearchEvent {}

class PerformSearchEvent extends SearchEvent {
  final String query;

  PerformSearchEvent(this.query);
}

// Bloc
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final _searchSubject = BehaviorSubject<String>();

  late StreamSubscription<String> _searchSubscription;

  bool _isSearching = false;

  SearchBloc() : super(SearchInitialState()) {
    _searchSubscription = _searchSubject
        .distinct()
        .debounceTime(Duration(milliseconds: 700))
        .listen((query) {
      if (_isSearching) {
        _searchSubscription.cancel();
      }

      _isSearching = true;

      add(PerformSearchEvent(query));
    });
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is PerformSearchEvent) {
      yield SearchLoadingState();

      try {
        final results = await httpRepository.searchMovies(event.query);

        yield SearchResultsState(results);
      } catch (error) {
        yield SearchErrorState('Error searching movies');
      } finally {
        _isSearching = false;
      }
    }
  }

  @override
  Future<void> close() {
    _searchSubject.close();

    _searchSubscription.cancel();

    return super.close();
  }

  void performSearch(String query) {
    _searchSubject.add(query);
  }
}

// States

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
