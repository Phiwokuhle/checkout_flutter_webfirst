import 'dart:convert';
import 'package:flutter/services.dart';

/// Loads backend-shaped GraphQL response envelopes from bundled JSON files.
class LocalGraphqlFixtures {
  const LocalGraphqlFixtures();

  Future<Map<String, dynamic>> load(String operation) async {
    final file = switch (operation) {
      'GetServices' => 'catalog.json',
      'CreateOrder' => 'create_order.json',
      'GetOrder' => 'get_order.json',
      _ => throw ArgumentError.value(operation, 'operation'),
    };
    final json = await rootBundle.loadString('assets/graphql/$file');
    final envelope = jsonDecode(json) as Map<String, dynamic>;
    if (envelope['data'] is! Map) {
      throw const FormatException('GraphQL fixture is missing data');
    }
    return envelope;
  }
}
