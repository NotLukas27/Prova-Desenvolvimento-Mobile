import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // A aplicação começa com o novo widget MyApp
}

// Widget principal que gerencia o tema da aplicação
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variável para controlar o modo do tema (claro ou escuro)
  ThemeMode _themeMode = ThemeMode.light; // Inicia no modo claro por padrão

  // Função para alternar o tema
  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // A tela inicial do aplicativo
      home: CadastroPetScreen(
        onThemeChanged: _toggleTheme, // Passa a função de alternar tema para a tela de cadastro
        currentThemeMode: _themeMode, // Passa o modo de tema atual
      ),
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug"
      themeMode: _themeMode, // Define o modo de tema atual para o MaterialApp

      // --- Definição do Tema Claro ---
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cor primária para o tema claro
        scaffoldBackgroundColor: Colors.lightBlue[50], // Cor de fundo do corpo (azul claro)
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent, // Cor da AppBar no tema claro
          foregroundColor: Colors.white, // Cor dos ícones e texto na AppBar
        ),
        textTheme: const TextTheme(
          // Estilo para títulos médios (ex: "Gênero", "Preferências")
          titleMedium: TextStyle(fontFamily: 'Roboto', color: Colors.blueAccent),
          // Estilo para o texto padrão do corpo
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.black87),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // Fundo branco para as caixas de texto
          border: const OutlineInputBorder(), // Borda padrão
          labelStyle: const TextStyle(fontFamily: 'Roboto', color: Colors.black54), // Cor do label
          prefixIconColor: Colors.grey[600], // Cor dos ícones de prefixo
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.blueAccent; // Cor do rádio selecionado
            }
            return Colors.grey;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.blueAccent; // Cor do checkbox selecionado
            }
            return Colors.grey;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.green; // Cor do "polegar" do switch quando ligado
            }
            return Colors.grey;
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.green.withOpacity(0.5); // Cor da "trilha" do switch quando ligado
            }
            return Colors.grey.withOpacity(0.5);
          }),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blueAccent,
            side: const BorderSide(color: Colors.blueAccent),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),

      // --- Definição do Tema Escuro ---
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey, // Cor primária para o tema escuro
        scaffoldBackgroundColor: Colors.black, // Cor de fundo do corpo (preto)
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900], // Cor da AppBar no tema escuro (cinza escuro)
          foregroundColor: Colors.white, // Cor dos ícones e texto na AppBar
        ),
        textTheme: const TextTheme(
          // Estilo para títulos médios (ex: "Gênero", "Preferências")
          titleMedium: TextStyle(fontFamily: 'Roboto', color: Colors.white), // Títulos brancos
          // Estilo para o texto padrão do corpo
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.white), // Texto branco
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // Fundo das caixas de texto permanece branco
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white), // Contorno branco para as caixas de texto
            borderRadius: BorderRadius.circular(4),
          ),
          labelStyle: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Label preto para contraste com o fundo branco da caixa
          prefixIconColor: Colors.grey[800], // Cor dos ícones de prefixo
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white; // Cor do rádio selecionado (branco)
            }
            return Colors.grey;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white; // Cor do checkbox selecionado (branco)
            }
            return Colors.grey;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.lightGreenAccent; // Verde mais claro para o switch no modo escuro
            }
            return Colors.grey;
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.lightGreenAccent.withOpacity(0.5);
            }
            return Colors.grey.withOpacity(0.5);
          }),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700], // Verde mais escuro para o botão Salvar
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white, // Texto e ícone brancos para o botão Limpar
            side: const BorderSide(color: Colors.white), // Borda branca para o botão Limpar
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

// A tela de cadastro de pet, agora recebe callbacks e o modo de tema atual
class CadastroPetScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode currentThemeMode;

  const CadastroPetScreen({
    super.key,
    required this.onThemeChanged,
    required this.currentThemeMode,
  });

  @override
  State<CadastroPetScreen> createState() => _CadastroPetScreenState();
}

class _CadastroPetScreenState extends State<CadastroPetScreen> {
  // Controladores para os campos de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _racaController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();

  // Variáveis para as opções de seleção
  String? _generoSelecionado; // 'Macho' ou 'Fêmea'
  bool _gostaDeCriancas = false;
  bool _conviveComOutrosAnimais = false;
  bool _disponivelParaAdocao = false;

  // Função para limpar todos os campos
  void _limparCampos() {
    setState(() {
      _nomeController.clear();
      _racaController.clear();
      _idadeController.clear();
      _observacoesController.clear();
      _generoSelecionado = null;
      _gostaDeCriancas = false;
      _conviveComOutrosAnimais = false;
      _disponivelParaAdocao = false; // Limpa o estado do switch também
    });
    _exibirSnackBar('Campos limpos!');
  }

  // Função para simular o salvamento (você expandiria isso para salvar dados reais)
  void _salvarPerfil() {
    // Aqui você coletaria todos os dados e os enviaria para algum lugar
    // Por exemplo, você pode imprimir no console para ver os valores
    print('--- Dados do Pet ---');
    print('Nome: ${_nomeController.text}');
    print('Raça: ${_racaController.text}');
    print('Idade: ${_idadeController.text}');
    print('Observações: ${_observacoesController.text}');
    print('Gênero: ${_generoSelecionado ?? 'Não selecionado'}');
    print('Gosta de crianças: $_gostaDeCriancas');
    print('Convive com outros animais: $_conviveComOutrosAnimais');
    print('Disponível para adoção: $_disponivelParaAdocao'); // Valor do switch
    print('--------------------');

    _exibirSnackBar('Perfil salvo (simulação)!');
  }

  // Função auxiliar para exibir uma mensagem na parte inferior da tela
  void _exibirSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    // Descartar os controladores para liberar recursos
    _nomeController.dispose();
    _racaController.dispose();
    _idadeController.dispose();
    _observacoesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se o tema atual é escuro
    final bool isDarkMode = widget.currentThemeMode == ThemeMode.dark;

    return Scaffold(
      // --- AppBar com ícone do usuário e botão de tema ---
      appBar: AppBar(
        title: const Text(
          'Cadastro de Perfil do Pet',
          // A cor do texto do título é definida no AppBarTheme do ThemeData
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        // A cor de fundo da AppBar é definida no AppBarTheme do ThemeData
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle), // A cor do ícone é definida no AppBarTheme
            onPressed: () {
              // Ação ao clicar no ícone do usuário
              _exibirSnackBar('Ícone do usuário clicado!');
            },
          ),
          // Botão de switch para alternar o tema (sol/lua)
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode), // Ícone muda conforme o tema
            onPressed: () {
              widget.onThemeChanged(!isDarkMode); // Notifica o widget pai para mudar o tema
            },
          ),
        ],
      ),
      // A cor de fundo do corpo é definida no ThemeData
      body: SingleChildScrollView(
        // Permite rolar a tela se o conteúdo for muito grande
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TextField: Nome do Pet ---
            TextField(
              controller: _nomeController,
              // Decoração e estilo são agora gerenciados pelo InputDecorationTheme e TextTheme
              decoration: const InputDecoration(
                labelText: 'Nome do Pet',
                prefixIcon: Icon(Icons.pets),
              ),
            ),
            const SizedBox(height: 16.0),

            // --- TextField: Raça ---
            TextField(
              controller: _racaController,
              decoration: const InputDecoration(
                labelText: 'Raça',
                prefixIcon: Icon(Icons.search), // Ícone de lupa para raça
              ),
            ),
            const SizedBox(height: 16.0),

            // --- TextField: Idade ---
            TextField(
              controller: _idadeController,
              keyboardType: TextInputType.number, // Teclado numérico
              decoration: const InputDecoration(
                labelText: 'Idade',
                prefixIcon: Icon(Icons.cake), // Ícone de bolo para idade
              ),
            ),
            const SizedBox(height: 16.0),

            // --- TextField: Observações ---
            TextField(
              controller: _observacoesController,
              maxLines: 3, // Permite múltiplas linhas
              decoration: const InputDecoration(
                labelText: 'Observações',
                alignLabelWithHint: true, // Alinha o label no topo para multilinhas
                prefixIcon: Icon(Icons.notes),
              ),
            ),
            const SizedBox(height: 24.0),

            // --- Gênero ---
            Text(
              'Gênero',
              style: Theme.of(context).textTheme.titleMedium, // Gerenciado pelo TextTheme
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('Macho', style: Theme.of(context).textTheme.bodyMedium), // Usa bodyMedium para estilo de texto consistente
                    value: 'Macho',
                    groupValue: _generoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _generoSelecionado = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('Fêmea', style: Theme.of(context).textTheme.bodyMedium), // Usa bodyMedium para estilo de texto consistente
                    value: 'Fêmea',
                    groupValue: _generoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _generoSelecionado = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // --- Preferências ---
            Text(
              'Preferências',
              style: Theme.of(context).textTheme.titleMedium, // Gerenciado pelo TextTheme
            ),
            CheckboxListTile(
              title: Text('Gosta de crianças', style: Theme.of(context).textTheme.bodyMedium), // Usa bodyMedium para estilo de texto consistente
              value: _gostaDeCriancas,
              onChanged: (bool? newValue) {
                setState(() {
                  _gostaDeCriancas = newValue ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading, // Checkbox à esquerda
            ),
            CheckboxListTile(
              title: Text('Convive bem com outros animais', style: Theme.of(context).textTheme.bodyMedium), // Usa bodyMedium para estilo de texto consistente
              value: _conviveComOutrosAnimais,
              onChanged: (bool? newValue) {
                setState(() {
                  _conviveComOutrosAnimais = newValue ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 24.0),

            // --- Switch: Disponível para adoção ---
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Disponível para adoção',
                    style: Theme.of(context).textTheme.titleMedium, // Gerenciado pelo TextTheme
                  ),
                ),
                Switch(
                  value: _disponivelParaAdocao,
                  onChanged: (bool newValue) {
                    setState(() {
                      _disponivelParaAdocao = newValue;
                    });
                  },
                  // A cor ativa do switch é definida no SwitchThemeData
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Exibe o status de adoção abaixo do switch
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _disponivelParaAdocao ? 'Status: Disponível' : 'Status: Não Disponível',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: _disponivelParaAdocao ? Colors.green : Colors.red,
                  fontFamily: 'Roboto', // Aplicando a fonte moderna
                ),
              ),
            ),
            const SizedBox(height: 32.0),

            // --- Botões ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botão Salvar
                ElevatedButton.icon(
                  onPressed: _salvarPerfil,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  // O estilo é gerenciado pelo ElevatedButtonThemeData
                ),
                // Botão Limpar
                OutlinedButton.icon(
                  onPressed: _limparCampos,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Limpar'),
                  // O estilo é gerenciado pelo OutlinedButtonThemeData
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
