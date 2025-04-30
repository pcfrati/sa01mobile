import 'package:flutter/material.dart';

// Tela principal do dashboard
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Define uma cor personalizada pros cartões
  final Color cardColor = const Color(0xFF35635e);
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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text(
          "HECHO",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
              child: const Center(
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
            _buildCard('20', 'PENDÊNCIAS'),

            // Cartão com número de urgentes
            _buildCard('4', 'URGENTES', urgent: true),

            // Dois blocos lado a lado: TODAS e CONCLUÍDAS
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Primeira metade
                  Expanded(child: _buildHalfCard('TODAS')),
                  // Segunda metade
                  Expanded(child: _buildHalfCard('CONCLUÍDAS')),
                ],
              ),
            ),
          ],
        ),
      ),

      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // O item selecionado
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

  // Método auxiliar para criar os cartões verticais (pendências e urgentes)
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
        alignment: Alignment.centerLeft, // Alinha todo o conteúdo à esquerda
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha os filhos à esquerda
          children: [
            Text(
              number, // Número
              style: const TextStyle(
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
            const SizedBox(height: 8), // Espaço entre textos
            Text(
              label, // Descrição
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

  // Método auxiliar para os cartões horizontais lado a lado (Todas / Concluídas)
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
