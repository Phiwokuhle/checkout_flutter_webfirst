import 'package:graphql/client.dart';
import 'package:gql/language.dart';
import '../../domain/checkout/data/service_model.dart';
import '../../domain/checkout/repositories/service_catalog_repository.dart';

class GraphqlServiceCatalog implements ServiceCatalogRepository {
  const GraphqlServiceCatalog(this.client);
  final GraphQLClient client;

  @override
  Future<List<ServiceModel>> load() async {
    final result = await client.query(QueryOptions(
      document: parseString(r'query GetServices { services { id name description durationMinutes priceCents badge } }'),
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (result.hasException) {
      throw StateError(result.exception.toString());
    }
    final raw = result.data?['services'];
    if (raw is! List) {
      throw const FormatException('Invalid services response');
    }
    return raw.map((value) {
      final item = Map<String, dynamic>.from(value as Map);
      return ServiceModel(
        id: item['id'] as String,
        name: item['name'] as String,
        description: item['description'] as String,
        durationMinutes: item['durationMinutes'] as int,
        priceCents: item['priceCents'] as int,
        badge: item['badge'] as String?,
      );
    }).toList(growable: false);
  }
}
