import 'package:flutter/material.dart';

// direciona para a pagina
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TelaLogin()));
}


// Registration screen widget (StatefulWidget)
class TelaLogin extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

// State for the registration screen
class _TelaCadastroState extends State<TelaLogin> {
  // Atributos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();


  // Function to handle form submission
  void _enviarCadastro() {
    // Basic validation or action
    if (_nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
       _senhaController.text.isNotEmpty
       ) {
      // In a real app, you would send this data somewhere
      print("Cadastro Enviado:");
      print("Nome: ${_nomeController.text}");
      print("Email: ${_emailController.text}");
      print("Senha: ${_senhaController.text}");

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro enviado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Show error message if fields are empty
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // deleta os campos dps q envia
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI for the registration screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("HECHO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(100.0),
        // Use SingleChildScrollView to prevent overflow when keyboard appears
        child: SingleChildScrollView(
          child: Column(
            // Align labels to the start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nome", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8.0),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  hintText: 'Digite seu nome completo',
                  border: OutlineInputBorder(), // Added border for better UI
                ),
              ),
              SizedBox(height: 20.0),
              Text("Email", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Digite seu e-mail',
                  border: OutlineInputBorder(), // Added border for better UI
                ),
              ),
              SizedBox(height: 20.0),
              Text("Senha", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8.0),
              TextField(
                controller: _senhaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(), // Added border for better UI
                ),
              ),
              SizedBox(height: 30.0), // Increased spacing before button
              // Stretch the button to full width
              SizedBox(
                 child: ElevatedButton(
                  onPressed: _enviarCadastro, // Call submission handler
                  child: Text("Enviar Cadastro"),
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.green, // Set button color
                     foregroundColor: Colors.white, // Set text color
                     textStyle: TextStyle(fontSize: 16) // Button text style
                  )
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}