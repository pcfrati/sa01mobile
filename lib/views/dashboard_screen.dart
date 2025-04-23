import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final Color cardColor = Color(0xFF35635e);  // Cor #35635e
  final Color selectedColor = Colors.white;
  final Color unselectedColor = Colors.white70;

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text("HACHE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card "Bem-vindo(a), (usuário)"
            Container(
              height: 100,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardColor,  // Cor do container
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Bem-vindo(a), (usuário)\nTotal de tarefas: **',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,  // Cor do texto
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Card "20 PENDÊNCIAS"
            Container(
              height: 120,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardColor,  // Cor do container
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,  // Cor do texto
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'PENDÊNCIAS',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,  // Cor do texto
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Card "4 URGENTES"
            Container(
              height: 140,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardColor,  // Cor do container
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '4',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,  // Cor do texto
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'URGENTES',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,  // Cor do texto
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Blocos lado a lado
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: cardColor,  // Cor do container
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'TODAS',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,  // Cor do texto
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: cardColor,  // Cor do container
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'CONCLUÍDAS',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,  // Cor do texto
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
