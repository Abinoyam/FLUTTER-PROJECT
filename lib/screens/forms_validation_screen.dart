import 'package:flutter/material.dart';

class FormsValidationScreen extends StatefulWidget {
  const FormsValidationScreen({super.key});
  @override
  State<FormsValidationScreen> createState() => _FormsValidationScreenState();
}

class _FormsValidationScreenState extends State<FormsValidationScreen> {
  final keyForm = GlobalKey<FormState>();
  final controller = TextEditingController();
  String status = 'Submit a valid number to see the result.';

  @override
  void dispose() { controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 7 — Forms & Validation')),
    body: Padding(padding: const EdgeInsets.all(20), child: Form(
      key: keyForm,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
          decoration: const InputDecoration(labelText: 'Enter a number', border: OutlineInputBorder()),
          validator: (text) {
            final number = double.tryParse((text ?? '').trim());
            if (number == null || !number.isFinite) return 'Enter a valid numeric value.';
            return null;
          },
        ),
        const SizedBox(height: 12),
        FilledButton(onPressed: () => setState(() {
          status = keyForm.currentState!.validate()
            ? 'Valid input: ${controller.text}'
            : 'Please fix the validation error.';
        }), child: const Text('Validate')),
        const SizedBox(height: 12),
        Text(status),
      ]),
    )),
  );
}
