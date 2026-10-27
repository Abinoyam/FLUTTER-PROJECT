import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter_flutter_project/main.dart';

void main() {
  testWidgets('home screen shows all ten ordered stages',
      (WidgetTester tester) async {
    await tester.pumpWidget(const UnitConverterApp());

    // Verify the home screen title.
    expect(find.text('Unit Converter'), findsOneWidget);

    // Verify all ten experiment titles.
    expect(find.text('Dart Basics'), findsOneWidget);
    expect(find.text('Widgets & Layouts'), findsOneWidget);
    expect(find.text('Responsive UI'), findsOneWidget);
    expect(find.text('Navigation'), findsOneWidget);
    expect(find.text('State Management'), findsOneWidget);
    expect(find.text('Custom Widgets & Themes'), findsOneWidget);
    expect(find.text('Forms & Validation'), findsOneWidget);
    expect(find.text('Animations'), findsOneWidget);
    expect(find.text('REST API'), findsOneWidget);
    expect(find.text('Testing & Debugging'), findsOneWidget);
  });
}
