import 'package:flutter/material.dart';

import '../models/investimento.dart';

class TelaResultado extends StatefulWidget {
  const TelaResultado({
    super.key,
    required this.investimento1,
    required this.investimento2,
    required this.meses,
  });

  final Investimento investimento1;
  final Investimento investimento2;
  final int meses;

  @override
  State<TelaResultado> createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  // Controla se a lista de evolução mensal deve aparecer na tela.
  bool _mostrarEvolucao = true;

  // Converte valores numéricos para uma visualização simples em reais.
  String _moeda(double valor) =>
      'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';

  Widget _resumo(Investimento investimento, List<double> evolucao, Color cor) {
    // O último valor da lista é o montante ao fim de todos os meses.
    final montante =
        evolucao.isEmpty ? investimento.capitalInicial : evolucao.last;
    final rendimento = montante - investimento.totalInvestido(widget.meses);
    // Cada resumo ocupa metade da linha para facilitar a comparação visual.
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: cor.withValues(alpha: .20)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E1B4B).withValues(alpha: .05),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_balance_wallet_rounded, color: cor),
            const SizedBox(height: 10),
            Text(investimento.nome,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Montante final',
                style: TextStyle(color: Color(0xFF6B7280))),
            Text(_moeda(montante),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: cor, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Rendimento total',
                style: TextStyle(color: Color(0xFF6B7280))),
            Text(_moeda(rendimento),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calcula, separadamente, a evolução dos dois investimentos mês a mês.
    final evolucao1 = widget.investimento1.calcularEvolucao(widget.meses);
    final evolucao2 = widget.investimento2.calcularEvolucao(widget.meses);
    final final1 = evolucao1.isEmpty
        ? widget.investimento1.capitalInicial
        : evolucao1.last;
    final final2 = evolucao2.isEmpty
        ? widget.investimento2.capitalInicial
        : evolucao2.last;
    // Compara os montantes finais para informar o investimento vencedor.
    final diferenca = (final1 - final2).abs();
    final vencedor = final1 == final2
        ? 'Os investimentos terminaram empatados.'
        : '${final1 > final2 ? widget.investimento1.nome : widget.investimento2.nome} rendeu mais: ${_moeda(diferenca)} de diferença.';

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado da comparação')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                _resumo(widget.investimento1, evolucao1, Colors.indigo),
                const SizedBox(width: 8),
                _resumo(widget.investimento2, evolucao2, Colors.teal),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF0F766E), Color(0xFF14B8A6)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.emoji_events_rounded,
                      color: Color(0xFFFFE9A8), size: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Comparação final',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(vencedor,
                            style: const TextStyle(color: Color(0xFFF0FDFA))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SwitchListTile(
              value: _mostrarEvolucao,
              // setState redesenha a tela imediatamente ao alterar o interruptor.
              onChanged: (valor) => setState(() => _mostrarEvolucao = valor),
              title: const Text('Mostrar evolução mensal'),
            ),
            if (_mostrarEvolucao) ...[
              const SizedBox(height: 8),
              Text(
                'Evolução mês a mês',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    const ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Mês',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Invest. 1',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Invest. 2',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    // Cria uma linha para cada mês usando os valores calculados.
                    ...List.generate(
                      widget.meses,
                      (indice) => ListTile(
                        dense: true,
                        title: Row(
                          children: [
                            Expanded(child: Text('${indice + 1}')),
                            Expanded(child: Text(_moeda(evolucao1[indice]))),
                            Expanded(child: Text(_moeda(evolucao2[indice]))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            OutlinedButton.icon(
              // Retorna ao formulário para que o usuário faça outra simulação.
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.refresh),
              label: const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Nova simulação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
