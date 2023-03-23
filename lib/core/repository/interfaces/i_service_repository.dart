import '../../../model/service.dart';

abstract class IServiceRepository {
  Future<List<Service>> getAll();
}