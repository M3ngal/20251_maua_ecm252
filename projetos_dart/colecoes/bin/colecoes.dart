import 'package:colecoes/colecoes.dart' as colecoes;
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // Exercicio
  print("Insira 6 números de 1 a 60");
  var gerador = Random();
  var jogo = [];
  int esc = 0;
  int i = 0;

  while(jogo.length < 6){
    print("Insira um número: ");
    String? escT = stdin.readLineSync();
    if(escT != null){
      esc = int.parse(escT);
    }
    if(esc >= 1 && esc <= 60){
      jogo.add(esc);
    }
    else{
      print("Insira um número válido!");
    }
  }
  jogo.sort();

  var venc = [];
  for(int a = 0; a<6; a++){
    venc.add(gerador.nextInt(60) + 1);
  }
  venc.sort();

  print("Acertos: ");
  for(int b = 0; b<6; b++){
    if(jogo[b] == venc[b]){
      print(jogo[b]);
    }
  }

  // type annotation
  // var nomes = <String> ["a", null];
  // const nomes = ['João', 'Ana'];
  // nomes.add('Pedro');
  // nomes[0] = 'João Silva';
  // final a;
  // print(a);
  // var a;
  // print(a);
  // List <dynamic> a = [];
  // var lista = [];
  // List <dynamic> nomes = ['Ana', 'Pedro'];
  // nomes.add(true);
  // nomes.add(1);
  // nomes[0].falar();
  // nomes.add(null);

  // List <Object?> outra = ['whatever', 1];
  // outra.add(true);
  // outra.add(null);
  // print(outra[0].hashCode);
  // var itensDiversos = [1, 1.2, true, "abc"];
  // for/in
  // enhanced
  // for(final item in itensDiversos){
  //   print(item);
  // }
  // var numeros = [1, 1.2];
  // var nomes = ['João', 'Pedro'];
}
