# Simulador de Investimentos

Aplicativo Flutter desenvolvido para comparar os rendimentos de dois investimentos usando juros compostos e aportes mensais.

## Funcionalidades

- Formulário com capital inicial, aporte mensal e taxa mensal para cada investimento.
- Período em meses compartilhado pelos dois investimentos.
- Validação dos dados informados, aceitando vírgula ou ponto em valores decimais.
- Cálculo do montante final, total investido e rendimento total.
- Tela de resultados comparando os dois investimentos lado a lado.
- Lista de evolução mensal para acompanhar os saldos mês a mês.
- Indicação do investimento com maior montante final.
- Botão para retornar e realizar uma nova simulação.

## Fórmula usada

Em cada mês, o app soma o aporte ao saldo e aplica a taxa de juros mensal:

```text
saldo = (saldo + aplicacaoMensal) × (1 + taxaMensal / 100)
```

O rendimento total é calculado por:

```text
rendimento = montanteFinal - capitalInicial - (aplicacaoMensal × meses)
```

## Como executar

1. Instale o [Flutter](https://docs.flutter.dev/get-started/install) e configure um emulador Android ou um navegador.
2. Na pasta do projeto, execute (este comando gera as pastas Android, iOS, Web e Desktop):

```bash
flutter create .
flutter pub get
flutter run
```

3. Preencha os dois investimentos e pressione **Calcular comparação**.


