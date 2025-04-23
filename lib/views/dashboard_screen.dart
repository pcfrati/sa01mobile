import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}

// Um widget que nunca muda (StatelessWidget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(), // Tela inicial
      debugShowCheckedModeBanner: false, // Tira aquele bannerzinho "DEBUG" do canto
    );
  }
}

// Tela principal do app
class DashboardScreen extends StatelessWidget {
  // Define uma cor personalizada pros cartões 
  final Color cardColor = Color(0xFF35635e); 
  final Color selectedColor = Colors.white; // Branco para itens selecionados (ícones, textos, etc)
  final Color unselectedColor = Colors.white70; // Branco meio transparente pros não selecionados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold é a estrutura básica de uma tela: appbar, corpo, menu, etc.
      drawer: Drawer(
        // Drawer = Menu lateral
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do menu
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            // Opções do menu
            ListTile(
              leading: const Icon(Icons.assignment_turned_in),
              title: const Text('Tarefas'),
              onTap: () {
                Navigator.pushNamed(context, '/tasks'); // Leva para a página da lista de tarefas
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

      // Barra superior da tela (azul/verde com o título)
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text("HECHO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.notifications, color: Colors.white), // Ícone de notificação
          SizedBox(width: 16),
        ],
      ),

      // Corpo da tela, com rolagem se precisar
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cartão de boas-vindas
            Container(
              height: 100,
              margin: const EdgeInsets.all(16), // Espaço fora do container
              padding: const EdgeInsets.all(12), // Espaço dentro do container
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8), // Arredondamento das bordas
              ),
              child: Center(
                child: Text(
                  'Bem-vindo(a), (usuário)\nTotal de tarefas: **', // Texto principal
                  textAlign: TextAlign.center, // Centralizado
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Cartão com número de pendências
            Container(
              height: 120,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(left:30),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.centerLeft, // Alinha todo o conteúdo à esquerda
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinha os filhos à esquerda
                  children: [
                    Text(
                      '20', // Número
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2), // Sombra deslocada
                            blurRadius: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8), // Espaço entre textos
                    Text(
                      'PENDÊNCIAS', // Descrição
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Cartão com número de urgentes
            Container(
              height: 140,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(left:30),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'URGENTES',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Dois blocos lado a lado: TODAS e CONCLUÍDAS
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Primeira metade
                  Expanded(
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'TODAS',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Segunda metade
                  Expanded(
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'CONCLUÍDAS',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // O item selecionado
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


