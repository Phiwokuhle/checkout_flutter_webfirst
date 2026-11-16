

import 'package:refreshi_checkout/domain/checkout/data/service_model.dart';

class CheckoutSelection {
  const CheckoutSelection(this.ids, this.totalCents, this.error);
  final List<String> ids;
  final int totalCents;
  final String? error;
}

class UpdateCheckoutSelection {
  const UpdateCheckoutSelection();

  CheckoutSelection call({
    required List<ServiceModel> catalog,
    required List<String> selectedIds,
    required String toggledId,
  }) {
    final prices = {for (final service in catalog) service.id: service.priceCents};
    final selected = [...selectedIds];
    String? error;
    if (!selected.remove(toggledId)) {
      if (selected.length >= 2) {
        error = 'You can select up to two services.';
      } else if (prices.containsKey(toggledId)) {
        selected.add(toggledId);
      }
    }
    final total = selected.fold<int>(0, (sum, id) => sum + (prices[id] ?? 0));
    return CheckoutSelection(List.unmodifiable(selected), total, error);
  }
}
