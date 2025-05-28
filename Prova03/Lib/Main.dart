import 'package:flutter/material.dart';

import 'package:Lib/Perfil_Pet_Screen.dart';

void main() {
  runApp(const MaterialApp(
    home: CadastroPetScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class CadastroPetScreen extends StatefulWidget {
  const CadastroPetScreen({super.key});

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
      _disponivelParaAdocao = false;
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
    print('Disponível para adoção: $_disponivelParaAdocao');
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
    return Scaffold(
      // --- AppBar com ícone do usuário ---
      appBar: AppBar(
        title: const Text('Cadastro de Perfil do Pet'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Ação ao clicar no ícone do usuário
              _exibirSnackBar('Ícone do usuário clicado!');
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Permite rolar a tela se o conteúdo for muito grande
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TextField: Nome do Pet ---
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Pet',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pets),
              ),
            ),
            const SizedBox(height: 16.0),

            // --- TextField: Raça ---
            TextField(
              controller: _racaController,
              decoration: const InputDecoration(
                labelText: 'Raça',
                border: OutlineInputBorder(),
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
                border: OutlineInputBorder(),
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
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.notes),
              ),
            ),
            const SizedBox(height: 24.0),

            // --- Gênero ---
            Text(
              'Gênero',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Macho'),
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
                    title: const Text('Fêmea'),
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CheckboxListTile(
              title: const Text('Gosta de crianças'),
              value: _gostaDeCriancas,
              onChanged: (bool? newValue) {
                setState(() {
                  _gostaDeCriancas = newValue ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading, // Checkbox à esquerda
            ),
            CheckboxListTile(
              title: const Text('Convive bem com outros animais'),
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
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Switch(
                  value: _disponivelParaAdocao,
                  onChanged: (bool newValue) {
                    setState(() {
                      _disponivelParaAdocao = newValue;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _disponivelParaAdocao ? 'Status: Disponível' : 'Status: Não Disponível',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: _disponivelParaAdocao ? Colors.green : Colors.red,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                // Botão Limpar
                OutlinedButton.icon(
                  onPressed: _limparCampos,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Limpar'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueAccent, // Cor do texto e ícone
                    side: const BorderSide(color: Colors.blueAccent), // Cor da borda
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
