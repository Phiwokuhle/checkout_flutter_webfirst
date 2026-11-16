
abstract final class ZaFormat {
  static const _months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  static String money(int cents) {
    final amount = (cents / 100).toStringAsFixed(2);
    final parts = amount.split('.');
    final whole = parts.first.replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ' ');
    return 'R $whole.${parts.last}';
  }
  static String schedule(DateTime date) {
    final local = date.toLocal();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '${local.day} ${_months[local.month - 1]} ${local.year}, $hour:$minute';
  }
  static String serviceName(String id) {
    switch (id) {
      case 'office-refresh': return 'Standard Office Air Refresh';
      case 'hepa-decontamination': return 'Deep HEPA Decontamination';
      case 'duct-treatment': return 'Bio-Enzymatic Duct Treatment';
      default: return id;
    }
  }
}
