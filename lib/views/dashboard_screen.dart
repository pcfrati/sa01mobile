import 'package:flutter/material.dart';

// Tela principal do dashboard
// StatelessWidget: não guarda estados, apenas constrói a interface
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Cores personalizadas para manter consistência visual
  final Color cardColor = const Color(0xFF35635e);
  final Color selectedColor = Colors.white;
  final Color unselectedColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: estrutura principal da tela (appbar, drawer, corpo e bottom navigation)

      drawer: Drawer(
        // Drawer: menu lateral para navegação
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
                Navigator.pushNamed(context, '/tasks'); // Navega para a página de tarefas
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
        // AppBar: barra superior com título e ações
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text(
          "HECHO",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        // SingleChildScrollView: permite rolagem quando o conteúdo ultrapassa o ecrã
        child: Column(
          children: [
            // Cartão de boas-vindas ao utilizador
            Container(
              height: 100,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Bem-vindo(a), (usuário)\nTotal de tarefas: **',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Cartões de estatísticas: Pendências, Urgentes
            _buildCard('20', 'PENDÊNCIAS'),
            _buildCard('4', 'URGENTES', urgent: true),

            // Cartões horizontais: Todas e Concluídas
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: _buildHalfCard('TODAS')),
                  Expanded(child: _buildHalfCard('CONCLUÍDAS')),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // BottomNavigationBar: navegação entre as principais seções
        currentIndex: 0,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
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

  // Método auxiliar: cria cartões verticais (Pendências, Urgentes)
  Widget _buildCard(String number, String label, {bool urgent = false}) {
    return Container(
      height: urgent ? 140 : 120,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(left: 30),
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
              number,
              style: const TextStyle(
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
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: urgent ? Colors.white70 : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar: cria cartões horizontais (Todas, Concluídas)
  Widget _buildHalfCard(String label) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
