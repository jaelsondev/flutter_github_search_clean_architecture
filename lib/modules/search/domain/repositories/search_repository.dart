import 'package:github_search_clean/modules/search/domain/entinties/result_search.dart';
import 'package:github_search_clean/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
