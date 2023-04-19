import 'package:flutter/material.dart';
import 'package:inscricao_estadual/inscricao_estadual.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inscricao Estadual',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inscricao Estadual'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IconData _icon = Icons.check_box_rounded;
  final ieController = TextEditingController();
  final estadoController = TextEditingController();
  final inscricaoEstadual = InscricaoEstadual();
  bool inscricaoEstadualEhValida = false;

  void _validarInscricao() {
    //O examplo abaixo contempla os estados de MG e RJ.
    //Para os demais estados fica a mesma lógica, à liberdade do programador de como irá preferir
    //a seleção dos estados brasileiros, sendo apenas necessário passar para o package o estado
    //selecionado.

    if (estadoController.text == 'MG') {
    
      inscricaoEstadualEhValida = inscricaoEstadual.validaInscricaoEstadual(
        inscricaoEstadual: ieController.text,
        sigla: Estados.MG,
      );
    } else if (estadoController.text == 'RJ') {
      inscricaoEstadualEhValida = inscricaoEstadual.validaInscricaoEstadual(
        inscricaoEstadual: ieController.text,
        sigla: Estados.RJ,
      );
    }
    if (inscricaoEstadualEhValida) {
      setState(() {
        _icon = Icons.check_box_rounded;
      });
      return;
    }
    setState(() {
      _icon = Icons.check_box_outline_blank_rounded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Digite abaixo a inscricao estadual:'),
            TextField(
              controller: ieController,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            const Text('Digite a sigla do Estado (Exemplo):'),
            TextField(
              controller: estadoController,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            ElevatedButton.icon(
              onPressed: _validarInscricao,
              icon: Icon(_icon),
              label: const Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}
