import '../repositories/service_catalog_repository.dart';
import '../data/service_model.dart';

class LoadCheckoutCatalog {
  const LoadCheckoutCatalog(this.catalog);
  final ServiceCatalogRepository catalog;
  Future<List<ServiceModel>> call() => catalog.load();
}
