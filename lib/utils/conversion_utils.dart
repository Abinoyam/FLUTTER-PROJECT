class ConversionUtils {
  static const Map<String, double> _factors = {
    'Meters': 1,
    'Kilometers': 1000,
    'Centimeters': 0.01,
    'Miles': 1609.344,
    'Feet': 0.3048,
    'Grams': 1,
    'Kilograms': 1000,
    'Pounds': 453.59237,
    'Ounces': 28.349523125,
  };

  static double convert(double value, String category, String from, String to) {
    if (category == 'Temperature') {
      final celsius = switch (from) {
        'Fahrenheit' => (value - 32) * 5 / 9,
        'Kelvin' => value - 273.15,
        _ => value,
      };
      return switch (to) {
        'Fahrenheit' => celsius * 9 / 5 + 32,
        'Kelvin' => celsius + 273.15,
        _ => celsius,
      };
    }
    return value * (_factors[from] ?? 1) / (_factors[to] ?? 1);
  }

  static String format(double value) {
    if (!value.isFinite) return 'Invalid';
    return value.toStringAsPrecision(7).replaceFirst(RegExp(r'\.?0+$'), '');
  }
}
