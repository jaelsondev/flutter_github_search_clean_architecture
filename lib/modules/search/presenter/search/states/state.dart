import 'package:github_search_clean/modules/search/domain/entinties/result_search.dart';
import 'package:github_search_clean/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchErro implements SearchState {
  final FailureSearch erro;

  SearchErro(this.erro);
}
