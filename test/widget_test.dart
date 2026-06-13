import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Login page muestra bienvenida', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenido'), findsOneWidget);
    expect(find.text('Ingresar'), findsOneWidget);
  });
}
