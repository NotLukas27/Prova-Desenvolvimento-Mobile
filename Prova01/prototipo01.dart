import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        hintColor:
            Colors.blueGrey.shade400, 
        scaffoldBackgroundColor: Colors.blue.shade100, 
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white, 
          labelStyle: const TextStyle(color: Colors.blueGrey),
          floatingLabelStyle: TextStyle(color: Colors.blue.shade700),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, 
            foregroundColor: Colors.white, 
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.blueGrey.shade800,
          ), 
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
          ), 
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ), 
          centerTitle: true,
        ),
      ),
      home: const IMCCalculator(),
    );
  }
}
 
class IMCCalculator extends StatefulWidget {
  const IMCCalculator({Key? key}) : super(key: key);
 
  @override
  State<IMCCalculator> createState() => _IMCCalculatorState();
}
 
class _IMCCalculatorState extends State<IMCCalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _result = '';
 
  void _calculateIMC() {
    double? height = double.tryParse(_heightController.text);
    double? weight = double.tryParse(_weightController.text);
 
    if (height != null && weight != null && height > 0 && weight > 0) {
      double imc = weight / (height * height);
      setState(() {
        _result = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _result = 'Por favor, insira altura e peso válidos.';
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora IMC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
                prefixIcon: Icon(Icons.straighten, color: Colors.blueGrey),
              ),
              style: const TextStyle(
                color: Colors.blueGrey,
              ), 
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                prefixIcon: Icon(
                  Icons.monitor_weight_outlined,
                  color: Colors.blueGrey,
                ),
              ),
              style: const TextStyle(
                color: Colors.blueGrey,
              ), 
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
