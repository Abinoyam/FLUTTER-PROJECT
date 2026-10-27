class ConversionRecord {
  final String category;
  final String input;
  final String fromUnit;
  final String toUnit;
  final String result;
  final DateTime createdAt;

  const ConversionRecord({
    required this.category,
    required this.input,
    required this.fromUnit,
    required this.toUnit,
    required this.result,
    required this.createdAt,
  });

  String get displayText => '$input $fromUnit = $result $toUnit';
}
