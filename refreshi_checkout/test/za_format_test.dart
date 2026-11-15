import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi_checkout/core/config/za_format.dart';

void main() {
  test('prices use South African rand and grouped thousands', () {
    expect(ZaFormat.money(4800), 'R 48.00');
    expect(ZaFormat.money(1234567), 'R 12 345.67');
  });
  test('schedule is readable and service IDs have labels', () {
    expect(ZaFormat.schedule(DateTime(2026, 11, 24, 9)), '24 Nov 2026, 09:00');
    expect(ZaFormat.serviceName('office-refresh'), 'Standard Office Air Refresh');
  });
}
