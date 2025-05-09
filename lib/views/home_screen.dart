import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaLogin> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _enviarCadastro() {
    if (_nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _senhaController.text.isNotEmpty) {
      print("Cadastro Enviado:");
      print("Nome: ${_nomeController.text}");
      print("Email: ${_emailController.text}");
      print("Senha: ${_senhaController.text}");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro enviado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navega para a tela de tarefas após o sucesso
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/tasks');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text(
          "HECHO",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [Icon(Icons.notifications, color: Colors.white), SizedBox(width: 16)],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(100, 20, 100, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Login", style: TextStyle(fontSize: 32)),
            const SizedBox(height: 16.0),
            Text("Nome", style: Theme.of(context).textTheme.titleMedium!),
            const SizedBox(height: 8.0),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                hintText: 'Digite seu nome completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Text("Email", style: Theme.of(context).textTheme.titleMedium!),
            const SizedBox(height: 8.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Digite seu e-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Text("Senha", style: Theme.of(context).textTheme.titleMedium!),
            const SizedBox(height: 8.0),
            TextField(
              controller: _senhaController,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Digite sua senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _enviarCadastro,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text("Enviar Cadastro"),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/tasks');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade700),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text("Entrar"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
