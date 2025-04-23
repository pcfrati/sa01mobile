import 'package:flutter/material.dart';

// direciona para a pagina
void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: TelaLogin()));
}

// Registration screen widget (StatefulWidget)
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaCadastroState();
}

// State for the registration screen
class _TelaCadastroState extends State<TelaLogin> {
  // Atributos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  get bottomNavigationBar => null;

  void _enviarCadastro() {
    //possivel enviar somente se tem algo escrito
    if (_nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _senhaController.text.isNotEmpty) {
      
      //mostra no terminal(?)
      print("Cadastro Enviado:");
      print("Nome: ${_nomeController.text}");
      print("Email: ${_emailController.text}");
      print("Senha: ${_senhaController.text}");
      
      //mssg de sucesso
      //scaffoldMessenger usa o showSnackBar para que ele apareça que nem uma notificação
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro enviado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // mssg de erro
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
      //
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(
                Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            const ListTile(
              leading: Icon(
                Icons.settings),
              title: Text('Configurações'),
            ),
            const ListTile(
              leading: Icon(
                Icons.help),
              title: Text('Ajuda'),
            ),
          ],
        ),
      ),
      //navbar
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),        
        backgroundColor: Colors.teal,
        title: const Text("HECHO",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        actions: const [Icon(Icons.notifications, color: Colors.white), SizedBox(width: 16)],
      ),
      //corpo
      body: Padding(
        //EdgeInsets.fromLTRB = left(esquerda), top(topo), right(direita), bottom(baixo)
        padding: const EdgeInsets.fromLTRB(100, 20, 100, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Login",
                style: TextStyle(fontSize: 32),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 10)),
              Text("Nome", style: Theme.of(context).textTheme.titleMedium!),
              const SizedBox(height: 8.0),
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu nome completo',
                  border: OutlineInputBorder(), // Added border for better UI
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
                  border: OutlineInputBorder(), // Added border for better UI
                ),
              ),
              const SizedBox(height: 20.0),
              Text("Senha", style: Theme.of(context).textTheme.titleMedium!),
              const SizedBox(height: 8.0),
              TextField(
                controller: _senhaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(), // Added border for better UI
                ),
              ),
              const SizedBox(height: 30.0), // Increased spacing before button
              // Stretch the button to full width
              SizedBox(
                child: ElevatedButton(
                  onPressed: _enviarCadastro, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal), // Set button color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set text color
                  ),
                  child: const Text("Enviar Cadastro"),
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
              )
    );
  }
}
