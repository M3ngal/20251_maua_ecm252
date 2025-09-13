import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppState extends State<App> {
  void obterImagem(){
    http.get(Uri.parse("https://api.pexels.com/v1/search"));
  }
  int numeroImagens = 0;
  final chaveApi = '';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Minhas Imagens'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          obterImagem();
          // setState(() {numeroImagens++;});
        },
        child: Icon(Icons.camera_alt),
        ),
        body: Text('Número de imagens: $numeroImagens'),
    ),
  );
  }
}

class App extends StatefulWidget {

  @override
  State<App> createState() {
    return AppState();
  }
}