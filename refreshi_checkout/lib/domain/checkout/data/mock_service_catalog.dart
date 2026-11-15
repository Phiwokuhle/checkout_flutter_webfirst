


import 'package:refreshi_checkout/domain/checkout/data/service_model.dart';

abstract final class MockServiceCatalog {
  static const services = <ServiceModel>[
    ServiceModel(
      id: 'office-refresh',
      name: 'Standard Office Air Refresh',
      description: '60-minute office air refresh service.',
      durationMinutes: 60,
      priceCents: 4800,
      badge: 'Standard',
    ),
    ServiceModel(
      id: 'hepa-decontamination',
      name: 'Deep HEPA Decontamination',
      description: '90-minute deep cleaning service.',
      durationMinutes: 90,
      priceCents: 8500,
      badge: 'Deep Clean',
    ),
    ServiceModel(
      id: 'duct-treatment',
      name: 'Bio-Enzymatic Duct Treatment',
      description: 'Targeted duct cleaning treatment.',
      durationMinutes: 45,
      priceCents: 12000,
      badge: 'Add-on',
    ),
  ];
}
