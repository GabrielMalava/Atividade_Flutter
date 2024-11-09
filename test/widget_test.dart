import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_servicos/main.dart'; // Verifique se o caminho está correto

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Constrói o widget `MyApp` e renderiza na tela de teste
    await tester.pumpWidget(const MyApp());

    // Verifica se o contador inicia em 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Toca no ícone de '+' e renderiza um novo quadro
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica se o contador foi incrementado para 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
