import '../data/service_model.dart';

abstract class ServiceCatalogRepository {
  Future<List<ServiceModel>> load();
}
