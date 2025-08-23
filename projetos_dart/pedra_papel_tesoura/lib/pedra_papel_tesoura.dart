// usar enum
// gerar opção do computador aleatoriamente
// usuario pode escolher o que deseja
import 'dart:io';
import 'dart:math';

enum OPCOES {Pedra, Papel, Tesoura, Sair}

void jogo(){
// enquanto o usuário não quiser sair
// exibir menu
int esc = 0;
var gerador = Random();
do{ 
  bool check = true;
  do{
      print("Escolha uma opção: \n(1) - Pedra\n(2) - Papel\n(3) - Tesoura\n(4) - Sair");
    // capturar opção do usuário, validando
    String? escT = stdin.readLineSync();
    if(escT != null){
      esc = int.parse(escT);
    }
    if(esc >= 1 && esc <= 4){
      check = false;
    }
    else{
      print("Insira uma opção válida!");
      esc = 0;
    }
   }while(check);
    // se o usuário escolher sair, sair
    if(esc != 4){
      // senão
      // sortear a escolha do computador
      int com = gerador.nextInt(3) + 1;
      //mapear opções do usuário de int para enum
      OPCOES op = OPCOES.Papel;
      switch(esc){
        case 1:
          op = OPCOES.Pedra;
        case 2:
          op = OPCOES.Papel;
        case 3:
          op = OPCOES.Tesoura;
      }
      OPCOES opc = OPCOES.Papel;
      switch(com){
        case 1:
          opc = OPCOES.Pedra;
        case 2:
          opc = OPCOES.Papel;
        case 3:
          opc = OPCOES.Tesoura; 
      }
      // exibir opções de cada um
      //Você(pedra) VS (papel)Computador
      print("Você(${op.name}) VS (${opc.name})Computador");
      // decidir quem venceu ou se houve empate
      String r;
      if(esc == com){
        r = "Empate\n";
      }
      else if(esc == 1 && com == 3 || esc == 2 && com == 1 || esc == 3 && com == 2){
        r = "Você Venceu!\n";
      }
      else{
        r = "Computador Venceu!\n";
      }
      // exibir o resultado
      print(r);
      // dormir por 4 segundos
      sleep(Duration(seconds: 4));
    }
  }while(esc != 4);
  print("Fim");
}