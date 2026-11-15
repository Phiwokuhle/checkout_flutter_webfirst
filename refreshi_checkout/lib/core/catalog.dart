class ServiceItem {
  const ServiceItem(this.id, this.name, this.priceCents, this.durationMinutes, this.description);
  final String id, name, description;
  final int priceCents, durationMinutes;
}
const catalog = <ServiceItem>[
  ServiceItem('clean', 'Home cleaning', 35000, 120, 'A thorough refresh for your home.'),
  ServiceItem('deep', 'Deep cleaning', 65000, 240, 'Extra attention to every detail.'),
  ServiceItem('laundry', 'Laundry service', 18000, 90, 'Fresh, folded and ready to go.'),
];
