import 'package:app_dentristy_mobile/model/news.dart';

abstract class IListNewsReposioty {
  Future<List<News>> getAll();
}