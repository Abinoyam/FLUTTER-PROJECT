import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/conversion_provider.dart';
import '../utils/conversion_utils.dart';
import '../widgets/result_card.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});
  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final input = TextEditingController(text: '1');
  String category = 'Length';
  String from = 'Kilometers';
  String to = 'Meters';
  String result = '1000';
  String? error;

  final units = const {
    'Length': ['Meters', 'Kilometers', 'Centimeters', 'Miles', 'Feet'],
    'Weight': ['Grams', 'Kilograms', 'Pounds', 'Ounces'],
    'Temperature': ['Celsius', 'Fahrenheit', 'Kelvin'],
  };

  @override
  void dispose() { input.dispose(); super.dispose(); }

  void convert() {
    final value = double.tryParse(input.text.trim());
    if (value == null || !value.isFinite) {
      setState(() => error = 'Enter a valid number to continue.');
      return;
    }
    final converted = context.read<ConversionProvider>().convert(
      input: input.text, category: category, fromUnit: from, toUnit: to,
    );
    setState(() { error = null; result = converted ?? ConversionUtils.format(value); });
  }

  void swapUnits() {
    setState(() {
      final oldFrom = from;
      from = to;
      to = oldFrom;
      result = '—';
    });
  }

  @override
  Widget build(BuildContext context) {
    final available = units[category]!;
    if (!available.contains(from)) from = available.first;
    if (!available.contains(to)) to = available[1];
    return LayoutBuilder(builder: (context, constraints) {
      final wide = constraints.maxWidth > 700;
      return ListView(
        padding: EdgeInsets.all(wide ? 28 : 18),
        children: [
          const Text('Unit Converter', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text('Convert measurements quickly and accurately.', style: TextStyle(color: Color(0xFF718096))),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [BoxShadow(color: Color(0x100B2B50), blurRadius: 18, offset: Offset(0, 6))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('CONVERSION TYPE', style: TextStyle(fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w900, color: Color(0xFF718096))),
              const SizedBox(height: 12),
              Wrap(spacing: 8, runSpacing: 8, children: [
                _categoryChip('Length', Icons.straighten_rounded, const Color(0xFF087CF0)),
                _categoryChip('Weight', Icons.scale_rounded, const Color(0xFF13A879)),
                _categoryChip('Temperature', Icons.thermostat_rounded, const Color(0xFFF97316)),
              ]),
              const SizedBox(height: 24),
              const Text('From', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: from,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.north_east_rounded), border: OutlineInputBorder()),
                isExpanded: true,
                items: available.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
                onChanged: (v) => setState(() { from = v!; result = '—'; }),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: input,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: InputDecoration(
                  labelText: 'Enter value',
                  hintText: 'e.g. 1',
                  prefixIcon: const Icon(Icons.edit_rounded),
                  errorText: error,
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (_) => convert(),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton.filled(
                    onPressed: swapUnits,
                    tooltip: 'Swap units',
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFFE3F0FF), foregroundColor: const Color(0xFF087CF0)),
                    icon: const Icon(Icons.swap_vert_rounded),
                  ),
                ),
              ),
              const Text('To', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: to,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.south_west_rounded), border: OutlineInputBorder()),
                isExpanded: true,
                items: available.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
                onChanged: (v) => setState(() { to = v!; result = '—'; }),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: convert,
                  icon: const Icon(Icons.calculate_rounded),
                  label: const Text('Convert Now', style: TextStyle(fontWeight: FontWeight.w800)),
                ),
              ),
              const SizedBox(height: 18),
              ResultCard(result: result, unit: to),
            ]),
          ),
        ],
      );
    });
  }

  Widget _categoryChip(String label, IconData icon, Color color) {
    final selected = category == label;
    return ChoiceChip(
      selected: selected,
      showCheckmark: false,
      avatar: Icon(icon, size: 18, color: selected ? Colors.white : color),
      label: Text(label),
      labelStyle: TextStyle(fontWeight: FontWeight.w800, color: selected ? Colors.white : color),
      selectedColor: color,
      backgroundColor: color.withOpacity(.09),
      side: BorderSide(color: selected ? color : color.withOpacity(.15)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      onSelected: (_) => setState(() {
        category = label;
        from = units[label]!.first;
        to = units[label]![1];
        result = '—';
        error = null;
      }),
    );
  }
}
