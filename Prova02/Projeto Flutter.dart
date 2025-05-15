import 'dart:math';
import 'package:flutter/material.dart';
 
class JogoDoTesouro {
  int tesouro;
  int bomba;
  int pirata;
  bool jogoFinalizado = false;
 
  JogoDoTesouro()
      : tesouro = 0,
        bomba = 0,
        pirata = 0 {
    _sortearPosicoes();
  }
 
  void _sortearPosicoes() {
    Random random = Random();
    List<int> numeros = List.generate(20, (index) => index + 1)..shuffle();
 
    tesouro = numeros[0];
    bomba = numeros[1];
    pirata = numeros[2];
  }
 
  String verificarEscolha(int numero) {
    if (jogoFinalizado) return "O jogo já acabou!";
 
    if (numero == tesouro) {
      jogoFinalizado = true;
      return "🎉 Você encontrou o tesouro! Parabéns!";
    } else if (numero == bomba) {
      jogoFinalizado = true;
      return "💣 Você encontrou a bomba! Fim de jogo.";
    } else if (numero == pirata) {
      jogoFinalizado = true;
      return "☠️ O pirata te pegou! Fim de jogo.";
    } else {
      if (numero < tesouro) {
        return "O tesouro está em um número MAIOR.";
      } else {
        return "O tesouro está em um número MENOR.";
      }
    }
  }
}
void main() {
  runApp(MaterialApp(
    home: JogoDoTesouroPage(),
    debugShowCheckedModeBanner: false,
  ));
}
 
class JogoDoTesouroPage extends StatefulWidget {
  @override
  _JogoDoTesouroPageState createState() => _JogoDoTesouroPageState();
}
 
class _JogoDoTesouroPageState extends State<JogoDoTesouroPage> {
  int? tesouro;
  int? bomba;
  int? pirata;
  bool jogoFinalizado = false;
  String mensagem = "Encontre o tesouro!";
  List<bool> botoesAtivos = List.generate(20, (_) => true);
 
  @override
  void initState() {
    super.initState();
    _sortearPosicoes();
  }
 
  void _sortearPosicoes() {
    List<int> numeros = List.generate(20, (index) => index + 1)..shuffle();
    tesouro = numeros[0];
    bomba = numeros[1];
    pirata = numeros[2];
  }
 
  void _verificarEscolha(int numero) {
    if (jogoFinalizado) return;
 
    setState(() {
      if (numero == tesouro) {
        mensagem = "🎉 Você encontrou o tesouro! Parabéns!";
        jogoFinalizado = true;
        botoesAtivos = List.generate(20, (_) => false);
      } else if (numero == bomba) {
        mensagem = "💣 Você encontrou a bomba! Fim de jogo.";
        jogoFinalizado = true;
        botoesAtivos = List.generate(20, (_) => false);
      } else if (numero == pirata) {
        mensagem = "☠️ O pirata te pegou! Fim de jogo.";
        jogoFinalizado = true;
        botoesAtivos = List.generate(20, (_) => false);
      } else {
        mensagem = numero < tesouro!
            ? "O tesouro está em um número MAIOR."
            : "O tesouro está em um número MENOR.";
        botoesAtivos[numero - 1] = false;
      }
    });
  }
 
  void _reiniciarJogo() {
    setState(() {
      jogoFinalizado = false;
      mensagem = "Encontre o tesouro!";
      botoesAtivos = List.generate(20, (_) => true);
      _sortearPosicoes();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      appBar: AppBar(
        title: const Text('💎 The Jogo'),
        centerTitle: true,
        backgroundColor: Colors.green[800], // Verde escuro
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          children: [
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  int numeroBotao = index + 1;
                  return SizedBox(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: botoesAtivos[index]
                          ? () => _verificarEscolha(numeroBotao)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botoesAtivos[index]
                            ? Colors.green
                            : Colors.grey[300],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 2,
                        shadowColor: Colors.black12,
                      ),
                      child: Text(
                        '$numeroBotao',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _reiniciarJogo,
              child: const Text('🔄 Reiniciar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
