import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: submitButton(bloc),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot <String> snapshot){
        return TextField(
          onChanged: (novoTexto){
            bloc.changeEmail(novoTexto);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'seu@email.com',
            labelText: 'Endereço de e-mail',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot <String> snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Senha',
            labelText: 'Senha',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.emailAndPasswordAreOk,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? bloc.submitForm : null,
          child: Text('Login'),
        );
      },
    );
  }
}