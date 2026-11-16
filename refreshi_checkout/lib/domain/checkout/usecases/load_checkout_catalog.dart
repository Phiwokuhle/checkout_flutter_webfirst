import '../../../data/checkout/graphql_service_catalog.dart';
import '../data/service_model.dart';

class LoadCheckoutCatalog {
  const LoadCheckoutCatalog(this.catalog);
  final GraphqlServiceCatalog catalog;
  Future<List<ServiceModel>> call() => catalog.load();
}
