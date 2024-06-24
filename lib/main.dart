import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ask the Universe')),
        body: const Center(
          child: RandomChoiceWidget(),
        ),
      ),
    );
  }
}

class RandomChoiceWidget extends StatefulWidget {
  const RandomChoiceWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomChoiceWidgetState createState() => _RandomChoiceWidgetState();
}

class _RandomChoiceWidgetState extends State<RandomChoiceWidget> {
  dynamic _currentChoice;

  void _makeRandomChoice() {
    setState(() {
      // Generate random index
      int randomIndex = Random().nextInt(3);
      // Varnt random
      List<dynamic> choices = [
        Image.network(
          'https://media.giphy.com/media/QCH0pBGnPKxaM/giphy.gif',
          height: 200,
        ),
        Image.network(
          'https://media.giphy.com/media/WQr2txk5iEYUS6Kv3d/giphy.gif',
          height: 200,
        ),
        Image.network(
          'https://media.giphy.com/media/JtLrtaN4VPoKXJRKGB/giphy.gif',
          height: 200,
        ),
      ];
      _currentChoice = choices[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_currentChoice != null)
          _currentChoice is String ? Text(_currentChoice) : _currentChoice,
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _makeRandomChoice,
          child: const Text('Yes or No'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
