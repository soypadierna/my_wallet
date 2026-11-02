class MoneyParts {
  const MoneyParts({required this.main, required this.cents});

  /// Parte principal con símbolo, ej. `$12.329`.
  final String main;

  /// Centavos con coma, ej. `,20`.
  final String cents;
}

abstract final class Formatters {
  static final RegExp _thousands = RegExp(r'\B(?=(\d{3})+(?!\d))');

  static String _group(int value) =>
      value.toString().replaceAllMapped(_thousands, (_) => '.');

  /// 12329.20 -> main: `$12.329`, cents: `,20`.
  static MoneyParts moneyParts(double value, {String symbol = r'$'}) {
    final totalCents = (value.abs() * 100).round();
    final whole = totalCents ~/ 100;
    final cents = totalCents % 100;
    return MoneyParts(
      main: '$symbol${_group(whole)}',
      cents: ',${cents.toString().padLeft(2, '0')}',
    );
  }

  /// 12329.20 -> `$12.329,20`.
  static String money(double value, {String symbol = r'$'}) {
    final parts = moneyParts(value, symbol: symbol);
    return '${parts.main}${parts.cents}';
  }

  /// -15 -> `-$15`, 200 -> `+$200`, 2432.43 -> `+$2.432,43`.
  static String signedMoney(double amount, {String symbol = r'$'}) {
    final parts = moneyParts(amount, symbol: symbol);
    final sign = amount < 0 ? '-' : '+';
    final hasCents = (amount.abs() * 100).round() % 100 != 0;
    return '$sign${parts.main}${hasCents ? parts.cents : ''}';
  }

  /// +2.10 -> `+2.10%`.
  static String percent(double value, {int decimals = 2}) {
    final sign = value < 0 ? '-' : '+';
    return '$sign${value.abs().toStringAsFixed(decimals)}%';
  }

  /// `Yesterday`, `3h ago`, `10.05.2024`.
  static String relativeDate(DateTime date, {DateTime? now}) {
    final ref = now ?? DateTime.now();
    final diff = ref.difference(date);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';

    final refDay = DateTime.utc(ref.year, ref.month, ref.day);
    final dateDay = DateTime.utc(date.year, date.month, date.day);
    if (refDay.difference(dateDay).inDays == 1) return 'Yesterday';

    final dd = date.day.toString().padLeft(2, '0');
    final mm = date.month.toString().padLeft(2, '0');
    return '$dd.$mm.${date.year}';
  }
}