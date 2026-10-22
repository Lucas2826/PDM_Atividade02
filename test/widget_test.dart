import 'package:flutter_test/flutter_test.dart';

import 'package:simulador_investimentos/main.dart';

void main() {
  testWidgets('exibe o formulário de comparação ao iniciar o aplicativo', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SimuladorApp());

    expect(find.text('Compare dois investimentos'), findsOneWidget);
    expect(find.text('Investimento 1'), findsOneWidget);
    expect(find.text('Investimento 2'), findsOneWidget);
    expect(find.text('Calcular comparação'), findsOneWidget);
  });
}
