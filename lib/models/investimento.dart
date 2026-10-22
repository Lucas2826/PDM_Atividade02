/// Dados inseridos para um investimento e seu resultado calculado.
class Investimento {
  const Investimento({
    required this.nome,
    required this.capitalInicial,
    required this.aplicacaoMensal,
    required this.taxaMensal,
  });

  final String nome;
  final double capitalInicial;
  final double aplicacaoMensal;

  /// Taxa em percentual. Ex.: 1.0 representa 1% ao mês.
  final double taxaMensal;

  /// Calcula o saldo ao fim de cada mês usando juros compostos.
  List<double> calcularEvolucao(int meses) {
    var saldo = capitalInicial;
    final evolucao = <double>[];
    final taxaDecimal = taxaMensal / 100;

    for (var mes = 1; mes <= meses; mes++) {
      // Primeiro fazemos o aporte e, em seguida, aplicamos os juros do mês.
      saldo = (saldo + aplicacaoMensal) * (1 + taxaDecimal);
      evolucao.add(saldo);
    }
    return evolucao;
  }

  double totalInvestido(int meses) => capitalInicial + aplicacaoMensal * meses;
}
