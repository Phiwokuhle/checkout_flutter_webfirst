import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi_checkout/data/graphql/local_graphql_fixtures.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const fixtures = LocalGraphqlFixtures();

  test('catalog fixture has a backend-shaped GraphQL data envelope', () async {
    final response = await fixtures.load('GetServices');
    final services = response['data']['services'] as List;
    expect(services, hasLength(3));
    expect(services.first['__typename'], 'Service');
    expect(services.first['priceCents'], isA<int>());
  });

  test('order fixtures use matching GraphQL response keys', () async {
    final created = await fixtures.load('CreateOrder');
    final fetched = await fixtures.load('GetOrder');
    expect(created['data']['createOrder']['__typename'], 'Order');
    expect(fetched['data']['order']['holdStatus'], 'PLACED');
  });
}
