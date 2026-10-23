📊 Simulador de Investimentos

Aplicativo desenvolvido em Flutter e Dart para simular e comparar o rendimento de dois investimentos ao longo do tempo, considerando juros compostos e aportes mensais.

O projeto foi desenvolvido como atividade acadêmica de Programação para Dispositivos Móveis (PDM), com o objetivo de praticar conceitos de desenvolvimento mobile, validação de dados, cálculos financeiros e apresentação de resultados.

🎯 Objetivo

Permitir que o usuário informe os dados de dois investimentos e visualize uma comparação entre seus resultados, facilitando a compreensão do efeito dos juros compostos e dos aportes mensais sobre o patrimônio acumulado.

✨ Funcionalidades

- 📝 Entrada de dados: informa o capital inicial, o aporte mensal e a taxa de juros mensal de cada investimento.
- 📅 Definição do período: permite escolher a quantidade de meses da simulação.
- ✅ Validação de dados: trata os valores informados e aceita vírgula ou ponto como separador decimal.
- 🧮 Cálculo dos rendimentos: calcula o montante final, o total investido e o rendimento acumulado.
- ⚖️ Comparação de investimentos: apresenta os resultados dos dois investimentos para facilitar a análise.
- 📈 Evolução mensal: permite acompanhar a variação dos saldos ao longo do período simulado.
- 🏆 Identificação do maior montante: indica qual investimento termina com o maior saldo.
- 🔄 Nova simulação: permite retornar à tela inicial e realizar outra comparação.

🧮 Como os cálculos funcionam?

O simulador utiliza juros compostos com aportes mensais. A cada mês, o aporte é adicionado ao saldo e, em seguida, a taxa de juros é aplicada.

Fórmula utilizada na simulação:

saldo = (saldo + aporte_mensal) × (1 + taxa_mensal / 100)

O rendimento total é calculado pela diferença entre o montante final e o valor total aplicado:

total_investido = capital_inicial + (aporte_mensal × meses)

rendimento = montante_final - total_investido

Observação: a ordem de aplicação do aporte e dos juros influencia o resultado. Neste simulador, o aporte mensal é adicionado antes da aplicação dos juros de cada mês.

🛠️ Tecnologias utilizadas

- Flutter: framework para desenvolvimento de aplicações multiplataforma.
- Dart: linguagem de programação utilizada no projeto.
- Git e GitHub: versionamento e hospedagem do código-fonte.

📋 Pré-requisitos

Antes de executar o projeto, você precisa ter:

- "Flutter SDK" (https://docs.flutter.dev/get-started/install) instalado e configurado.
- Dart SDK, disponibilizado junto com o Flutter.
- Um editor de código, como "Visual Studio Code" (https://code.visualstudio.com/).
- Um dispositivo, emulador ou navegador compatível para executar o aplicativo.

Para verificar se o ambiente está configurado corretamente, execute:

flutter doctor

🚀 Como executar o projeto

1. Clone o repositório

git clone https://github.com/Lucas2826/PDM_Atividade02.git

2. Entre na pasta do projeto

cd PDM_Atividade02

3. Instale as dependências

flutter pub get

4. Execute o aplicativo

flutter run

Se houver mais de um dispositivo disponível, você poderá selecionar o dispositivo de destino conforme as opções exibidas pelo Flutter.

📱 Como utilizar

1. Abra o aplicativo.
2. Informe o capital inicial do primeiro investimento.
3. Preencha o aporte mensal e a taxa de juros mensal.
4. Informe os dados correspondentes ao segundo investimento.
5. Defina o período da simulação em meses.
6. Acione o botão para calcular a comparação.
7. Analise os montantes finais, os rendimentos e a evolução mensal dos saldos.
8. Se desejar, retorne e realize uma nova simulação.

📂 Estrutura do projeto

PDM_Atividade02/
├── android/       # Configurações da plataforma Android
├── ios/           # Configurações da plataforma iOS
├── lib/           # Código-fonte principal do aplicativo
├── linux/         # Configurações para Linux
├── macos/         # Configurações para macOS
├── test/          # Testes automatizados
├── web/           # Configurações para Web
├── windows/       # Configurações para Windows
├── pubspec.yaml   # Dependências e configurações do Flutter
└── README.md      # Documentação do projeto

🎓 Aprendizados

O desenvolvimento deste projeto permite praticar conceitos importantes, como:

- Desenvolvimento de interfaces com Flutter.
- Programação com Dart.
- Entrada e validação de dados.
- Aplicação de fórmulas matemáticas em código.
- Organização e apresentação de resultados.
- Uso do GitHub para documentação e versionamento.

⚠️ Aviso

Este aplicativo tem finalidade educacional. Os resultados são simulações matemáticas e não representam garantia de rentabilidade, recomendação de investimento ou previsão de resultados reais do mercado financeiro.

👨‍💻 Autor

Lucas Maciel da Silva

- GitHub: "@Lucas2826" (https://github.com/Lucas2826)
- Projeto: "PDM_Atividade02" (https://github.com/Lucas2826/PDM_Atividade02)

---

Desenvolvido como atividade acadêmica de Programação para Dispositivos Móveis (PDM).

Se este projeto foi útil para você, considere deixar uma ⭐ no repositório!