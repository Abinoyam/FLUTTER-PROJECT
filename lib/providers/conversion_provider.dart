import 'package:flutter/foundation.dart';
import '../models/conversion_record.dart';
import '../utils/conversion_utils.dart';

class ConversionProvider extends ChangeNotifier {
  final List<ConversionRecord> _history = [];
  List<ConversionRecord> get history => List.unmodifiable(_history);
  String? lastResult;

  String? convert({
    required String input,
    required String category,
    required String fromUnit,
    required String toUnit,
  }) {
    final value = double.tryParse(input.trim());
    if (value == null || !value.isFinite) return null;

    final converted = ConversionUtils.convert(value, category, fromUnit, toUnit);
    final formatted = ConversionUtils.format(converted);
    lastResult = formatted;
    _history.insert(0, ConversionRecord(
      category: category,
      input: input,
      fromUnit: fromUnit,
      toUnit: toUnit,
      result: formatted,
      createdAt: DateTime.now(),
    ));
    if (_history.length > 50) _history.removeLast();
    notifyListeners();
    return formatted;
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}
