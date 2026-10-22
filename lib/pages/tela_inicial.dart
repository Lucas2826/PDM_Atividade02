import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/investimento.dart';
import 'tela_resultado.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Chave usada para validar todos os campos do formulário de uma vez.
  final _formKey = GlobalKey<FormState>();

  // Controladores guardam o texto digitado pelo usuário em cada campo.
  final _capital1 = TextEditingController(text: '1000');
  final _aporte1 = TextEditingController(text: '100');
  final _taxa1 = TextEditingController(text: '1');
  final _capital2 = TextEditingController(text: '1000');
  final _aporte2 = TextEditingController(text: '100');
  final _taxa2 = TextEditingController(text: '1.2');
  final _meses = TextEditingController(text: '12');

  @override
  void dispose() {
    // Libera os controladores quando esta tela deixa de existir.
    for (final controller in [
      _capital1,
      _aporte1,
      _taxa1,
      _capital2,
      _aporte2,
      _taxa2,
      _meses,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  // Aceita tanto vírgula quanto ponto em valores decimais.
  double _valor(String texto) => double.parse(texto.replaceAll(',', '.'));

  // Valida se o texto é numérico, não negativo e, quando necessário, inteiro.
  String? _validarNumero(
    String? valor, {
    bool inteiro = false,
    bool positivo = false,
  }) {
    final numero = double.tryParse((valor ?? '').replaceAll(',', '.'));
    if (numero == null ||
        numero < 0 ||
        (positivo && numero == 0) ||
        (inteiro && numero != numero.roundToDouble())) {
      return inteiro
          ? 'Informe um número inteiro maior que zero.'
          : 'Informe um valor não negativo.';
    }
    return null;
  }

  Widget _campo(
    String rotulo,
    TextEditingController controller, {
    bool inteiro = false,
    bool positivo = false,
    IconData? icone,
  }) {
    // Método reutilizável para manter todos os campos com o mesmo padrão.
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
        ],
        validator: (valor) =>
            _validarNumero(valor, inteiro: inteiro, positivo: positivo),
        decoration: InputDecoration(
          labelText: rotulo,
          prefixIcon: icone == null ? null : Icon(icone),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _cardInvestimento(
    String titulo,
    Color cor,
    IconData icone,
    TextEditingController capital,
    TextEditingController aporte,
    TextEditingController taxa,
  ) {
    // Método reutilizável que monta os campos de cada investimento.
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cor.withValues(alpha: .18)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E1B4B).withValues(alpha: .06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cor.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icone, color: cor),
                ),
                const SizedBox(width: 12),
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF1E1B4B),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _campo('Capital inicial (R\$)', capital,
                icone: Icons.account_balance_wallet_outlined),
            _campo('Aplicação mensal (R\$)', aporte,
                icone: Icons.add_card_outlined),
            _campo('Taxa de juros mensal (%)', taxa,
                icone: Icons.percent_rounded),
          ],
        ),
      ),
    );
  }

  void _simular() {
    // Só continua quando todos os valores informados forem válidos.
    if (!_formKey.currentState!.validate()) return;

    // Converte os textos digitados em objetos que representam investimentos.
    final investimento1 = Investimento(
      nome: 'Investimento 1',
      capitalInicial: _valor(_capital1.text),
      aplicacaoMensal: _valor(_aporte1.text),
      taxaMensal: _valor(_taxa1.text),
    );
    final investimento2 = Investimento(
      nome: 'Investimento 2',
      capitalInicial: _valor(_capital2.text),
      aplicacaoMensal: _valor(_aporte2.text),
      taxaMensal: _valor(_taxa2.text),
    );

    Navigator.of(context).push(
      // Abre a tela de resultados e envia os dados da simulação.
      MaterialPageRoute(
        builder: (_) => TelaResultado(
          investimento1: investimento1,
          investimento2: investimento2,
          meses: _valor(_meses.text).round(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simulador de Investimentos')),
      body: SafeArea(
        // O Form reúne os campos e permite validá-los antes do cálculo.
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF312E81), Color(0xFF4F46E5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4F46E5).withValues(alpha: .25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.insights_rounded, color: Colors.white, size: 32),
                    SizedBox(height: 14),
                    Text(
                      'Compare dois investimentos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Descubra qual estratégia pode render mais para você.',
                      style: TextStyle(color: Color(0xFFE0E7FF), fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Dados da simulação',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              _cardInvestimento(
                'Investimento 1',
                Colors.indigo,
                Icons.trending_up_rounded,
                _capital1,
                _aporte1,
                _taxa1,
              ),
              _cardInvestimento(
                'Investimento 2',
                Colors.teal,
                Icons.savings_outlined,
                _capital2,
                _aporte2,
                _taxa2,
              ),
              _campo('Período em meses', _meses,
                  inteiro: true,
                  positivo: true,
                  icone: Icons.calendar_month_outlined),
              const SizedBox(height: 8),
              FilledButton.icon(
                onPressed: _simular,
                icon: const Icon(Icons.calculate),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Calcular comparação',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
