import 'package:flutter/material.dart';

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({Key? key}) : super(key: key);

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de tarefas')),
      ),
      body: ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 240, 240, 240),
              child: ListTile(
                title: Text(tarefas[index]),
                trailing: const Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
                onLongPress: () {
                  setState(() {
                    tarefas.removeAt(index);
                  });
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? resposta = await Navigator.of(context)
              .pushNamed('/segunda', arguments: '') as String?;
          if (resposta != null) {
            setState(() {
              tarefas.add(resposta);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
