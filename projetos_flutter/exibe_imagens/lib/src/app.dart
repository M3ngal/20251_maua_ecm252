import 'dart:convert';
import 'package:exibe_imagens/src/Models/image_model.dart';
import 'package:exibe_imagens/src/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppState extends State<App> {
  int numeroImagens = 0;
  List<ImageModel> imagens = [];

  void obterImagem() async{
    const chaveAPI = 'PjQiAy6MJXbijsvglYTdvFM7ZEKnbvLHcAwo4zDXCPVew1HV8F3Trnxy';
    final url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {'query': 'cats', 'page': '${numeroImagens + 1}', 'per_page': '1'}
    );
    // http.get(Uri.parse("https://api.pexels.com/v1/search"));
    final req = http.Request('get', url);
    req.headers.addAll({
      'Authorization': chaveAPI
    });
    final result = await req.send();
    final response = await http.Response.fromStream(result);
    if(response.statusCode == 200){
      final decodedJSON = json.decode(response.body);
      final imagem = ImageModel.fromJSON(decodedJSON);
      setState(() {
        imagens.add(imagem);
        numeroImagens++;
      });
    }
    else{
      print(response.statusCode);
    }
    // req.send().then((result) {
    //   http.Response.fromStream(result).then((response){
    //     if(response.statusCode == 200){
    //       print(response.body);
    //     }
    //     else{
    //       print(response.statusCode);
    //     }
    //   });
    // });
  }

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
        body: ImageList(imagens),
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