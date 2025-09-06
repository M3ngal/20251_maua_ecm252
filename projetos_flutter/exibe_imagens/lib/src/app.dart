import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Minhas Imagens'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Estou no arquivo app.dart'),
        child: Icon(Icons.camera_alt),
        ),
    ),
  );
  }
}