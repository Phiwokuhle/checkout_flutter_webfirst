
class ServiceModel {
  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.durationMinutes,
    required this.priceCents,
    this.badge,
  });

  final String id;
  final String name;
  final String description;
  final int durationMinutes;
  final int priceCents;
  final String? badge;
}
