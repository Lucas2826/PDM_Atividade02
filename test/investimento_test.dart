import 'package:flutter_test/flutter_test.dart';
import 'package:simulador_investimentos/models/investimento.dart';

void main() {
  test('calcula juros compostos com aporte mensal', () {
    const investimento = Investimento(
      nome: 'Teste',
      capitalInicial: 1000,
      aplicacaoMensal: 100,
      taxaMensal: 1,
    );

    final evolucao = investimento.calcularEvolucao(2);

    expect(evolucao.length, 2);
    expect(evolucao[0], closeTo(1111, 0.001));
    expect(evolucao[1], closeTo(1223.11, 0.001));
  });
}
