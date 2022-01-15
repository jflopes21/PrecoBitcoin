// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _calculaBitcoin() async {
    var url = Uri.parse('https://blockchain.info/ticker');
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _preco = retorno["BRL"]["last"].toString();
    });

    //print('Resultado: ' + retorno["BRL"]["buy"].toString());
  }

  String _preco = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/bitcoin.png'),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'R\$ ' + _preco,
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              ElevatedButton(
                onPressed: _calculaBitcoin,
                child: const Text('Atualizar'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(fontSize: 24),
                    fixedSize: const Size(150, 50)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
