import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  final String mensage;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();

  SegundaPagina({Key? key, required this.mensage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Adicionar tarefas')),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                bool validado = _formKey.currentState?.validate() ?? false;
                if (validado) {
                  Navigator.of(context).pop(_controller.text);
                }
              },
              child: const Text('Cadastrar tarefa'),
            )
          ]),
        ),
      ),
    );
  }
}
