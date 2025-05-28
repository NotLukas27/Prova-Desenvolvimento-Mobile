// lib/perfil_pet_screen.dart
import 'package:flutter/material.dart';

// --- Definição do Enum para Gênero (fora das classes) ---
enum PetGenero { macho, femea }

class PerfilPetScreen extends StatefulWidget {
  const PerfilPetScreen({super.key});

  @override
  State<PerfilPetScreen> createState() => _PerfilPetScreenState();
}

class _PerfilPetScreenState extends State<PerfilPetScreen> {
  // --- Controladores e GlobalKey do Formulário ---
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController racaController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController observacoesController = TextEditingController();

  // --- Variáveis de Estado para Seletores ---
  PetGenero? _generoSelecionado;
  bool _gostaCriancas = false;
  bool _conviveOutrosAnimais = false;
  bool _disponivelParaAdocao = false;

  // --- Função para limpar todos os campos usando reset() ---
  void _limparCampos() {
    setState(() {
      _formKey.currentState?.reset(); // Reseta os TextFormField
      nomeController.clear(); // Limpa manualmente se reset() não limpar tudo
      racaController.clear();
      idadeController.clear();
      observacoesController.clear();
      _generoSelecionado = null;
      _gostaCriancas = false;
      _conviveOutrosAnimais = false;
      _disponivelParaAdocao = false;
    });
    _exibirSnackBar('Campos limpos!');
  }

  // --- Função auxiliar para exibir uma SnackBar ---
  void _exibirSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // --- Limpeza dos controladores ao descartar o widget ---
  @override
  void dispose() {
    nomeController.dispose();
    racaController.dispose();
    idadeController.dispose();
    observacoesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calcula o padding inferior para evitar que o teclado oculte o conteúdo
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom + 16.0;

    return Scaffold(
      // --- AppBar com ícone do usuário ---
      appBar: AppBar(
        title: const Text('Perfil do Pet'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Perfil do Usuário',
            onPressed: () {
              _exibirSnackBar('Ícone do usuário clicado!');
            },
          ),
        ],
      ),
      // --- Body com SingleChildScrollView e Padding dinâmico ---
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: bottomPadding, // Padding dinâmico para o teclado
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Título e Texto de Introdução ---
            Text(
              'Cadastro de Perfil do Pet',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Preencha os dados do seu pet!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // --- Formulário com Campos de Texto e Validação ---
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- TextFormField para Nome do Pet ---
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Pet',
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome do pet';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // --- TextFormField para Raça do Pet ---
                  TextFormField(
                    controller: racaController,
                    decoration: const InputDecoration(
                      labelText: 'Raça',
                      prefixIcon: Icon(Icons.bug_report),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a raça do pet';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // --- TextFormField para Idade (em anos) ---
                  TextFormField(
                    controller: idadeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Idade (em anos)',
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a idade do pet';
                      }
                      final int? idade = int.tryParse(value);
                      if (idade == null || idade < 0) {
                        return 'A idade deve ser um número positivo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // --- TextFormField para Observações (opcional) ---
                  TextFormField(
                    controller: observacoesController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Observações (opcional)',
                      prefixIcon: Icon(Icons.notes),
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // --- Seletores de Gênero ---
            Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gênero do Pet',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<PetGenero>(
                            title: const Text('Macho'),
                            value: PetGenero.macho,
                            groupValue: _generoSelecionado,
                            onChanged: (PetGenero? value) {
                              setState(() {
                                _generoSelecionado = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<PetGenero>(
                            title: const Text('Fêmea'),
                            value: PetGenero.femea,
                            groupValue: _generoSelecionado,
                            onChanged: (PetGenero? value) {
                              setState(() {
                                _generoSelecionado = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // --- Preferências de Convivência ---
            Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferências de Convivência',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CheckboxListTile(
                      title: const Text('Gosta de crianças'),
                      value: _gostaCriancas,
                      onChanged: (bool? valor) {
                        setState(() {
                          _gostaCriancas = valor ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      title: const Text('Convive bem com outros animais'),
                      value: _conviveOutrosAnimais,
                      onChanged: (bool? valor) {
                        setState(() {
                          _conviveOutrosAnimais = valor ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // --- Status de Adoção com SwitchListTile e Texto de Status ---
            Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      title: const Text('Disponível para adoção'),
                      value: _disponivelParaAdocao,
                      onChanged: (bool valor) {
                        setState(() {
                          _disponivelParaAdocao = valor;
                        });
                      },
                    ),
                    // --- Text para exibir o status atual ---
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0), // Alinha com o texto do SwitchListTile
                      child: Text(
                        _disponivelParaAdocao ? 'Status: Disponível' : 'Status: Indisponível',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: _disponivelParaAdocao ? Colors.green[700] : Colors.red[700],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0),

            // --- Botões de Ação ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Melhor para distribuir botões de forma mais equitativa
              children: [
                // --- Botão Salvar ---
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Se o formulário for válido, exiba a SnackBar de sucesso
                      _exibirSnackBar('Dados salvos com sucesso!');

                      // Opcional: Aqui você pode coletar os dados e enviá-los para um serviço/API
                      print('--- Dados Coletados ---');
                      print('Nome: ${nomeController.text}');
                      print('Raça: ${racaController.text}');
                      print('Idade: ${idadeController.text}');
                      print('Observações: ${observacoesController.text}');
                      print('Gênero: ${_generoSelecionado?.name ?? 'Não selecionado'}');
                      print('Gosta de crianças: $_gostaCriancas');
                      print('Convive com outros animais: $_conviveOutrosAnimais');
                      print('Disponível para adoção: $_disponivelParaAdocao');
                      print('-----------------------');

                    } else {
                      // Se o formulário NÃO for válido, exiba a SnackBar de erro
                      _exibirSnackBar('Por favor, preencha todos os campos obrigatórios corretamente.');
                    }
                  },
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
                // --- Botão Limpar ---
                OutlinedButton.icon(
                  onPressed: _limparCampos,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Limpar'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    side: const BorderSide(color: Colors.blueAccent),
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
