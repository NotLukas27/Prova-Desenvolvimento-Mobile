# Equipe

- Guilherme Alves dos Santos
- Lucas Venancio Thiele


--


**Descrição Detalhada**

Este arquivo possui os principais componentes de layout/design que foram utilizados para a criação dos projetos desenvolvidos:

- Calculadora de IMC
- Cardápio de Restaurante Japonês


--


## 1. Class MyApp extends StatelessWidget

**Descrição**

Declara uma classe chamada ```MyApp``` que estende ```StatelessWidget```. Isso significa que ```MyApp``` é um widget que não possui estado mutável.  Suas propriedades não mudam durante a execução do programa.

**Tutorial**
```dart
Class MyApp extends StatelessWidget{...}
```


--


## 2. Const MyApp({Key? key}) : super(key: key)

**Descrição**

Este é o construtor da classe ```MyApp```. ```Key``` é um parâmetro opcional que é usado para controlar qual widget é substituído quando a árvore de widgets é reconstruída.  É bom prática incluir keys, especialmente em listas e outros casos complexos.

**Tutorial**
```dart
const MyApp({Key? key}) : super(key: key);
```


--


## 3. @override Widget build(BuildContext context) { ... }

**Descrição**

Este é o método principal que todo widget deve implementar. Ele descreve como construir a interface do usuário do widget.

**Tutorial**
```dart
@override
  Widget build(BuildContext context)
```


--


## 4. Return MaterialApp(...)

**Descrição**

É um widget que configura a estrutura básica de um aplicativo Flutter que segue o Material Design, definindo coisas como Título do aplicativo, tema do aplicativo (cores) e a página inicial do app.

**Tutorial**
```dart
return MaterialApp()
```


--


## 5. Title: 'Exemplo01'

**Descrição**

Define o título do aplicativo, que pode ser visível no gerenciador de tarefas do sistema operacional ou em outros contextos.

**Tutorial**
```dart
title: 'Exemplo01'
```


--


## 6. Theme: ThemeData(...)

**Descrição**

Define o tema visual do aplicativo.  ```ThemeData``` agrupa várias propriedades que controlam a aparência dos widgets.

**Tutorial**
```dart
theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueGrey.shade400,
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
        )
```


--


## 7. Home: const IMCCalculator()

**Descrição**

Define o widget que será exibido como a tela inicial do aplicativo.

**Tutorial**
```dart
home: const ExemploPrototipo01()
```
