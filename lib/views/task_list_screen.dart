import 'package:flutter/material.dart'; // Importa os widgets do Flutter (UI)

/// Tela de lista de tarefas
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> with TickerProviderStateMixin {
  final TextEditingController _tarefaController = TextEditingController(); // Controla o campo de texto
  List<Map<String, dynamic>> _tarefasFeitas = []; // Lista de tarefas concluídas
  List<Map<String, dynamic>> _tarefasAFazer = []; // Lista de tarefas a fazer

  late TabController _tabController; // Controlador das abas

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this); // Define 2 abas: A FAZER / FEITAS
    super.initState(); // Chama o init padrão
  }

  // Adiciona uma nova tarefa
  void _adicionarTarefa() {
    if (_tarefaController.text.trim().isNotEmpty) {
      setState(() {
        _tarefasAFazer.add({"titulo": _tarefaController.text, "concluida": false}); // Adiciona na lista
        _tarefaController.clear(); // Limpa o campo
      });
    }
  }

  // Move tarefa para "feitas"
  void _moverParaFeitas(Map<String, dynamic> tarefa) {
    setState(() {
      _tarefasAFazer.remove(tarefa); // Remove de "a fazer"
      _tarefasFeitas.add(tarefa); // Adiciona em "feitas"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // MENU LATERAL
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () => Navigator.pushNamed(context, '/dashboard'),
            ),
            ListTile(leading: Icon(Icons.settings), title: Text('Configurações')),
            ListTile(leading: Icon(Icons.help), title: Text('Ajuda')),
          ],
        ),
      ),

      // APPBAR
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text("HACHE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [Icon(Icons.notifications), SizedBox(width: 16)],
      ),

      // CORPO DA TELA
      body: Stack(
        children: [
          // CONTEÚDO DAS ABAS
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: TabBarView(
              controller: _tabController,
              children: [
                // ABA: A FAZER
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // CAMPO DE TEXTO
                      TextField(
                        controller: _tarefaController,
                        decoration: InputDecoration(
                          labelText: "Digite uma tarefa",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),

                      // LISTA DE TAREFAS A FAZER
                      Expanded(
                        child: ListView.builder(
                          itemCount: _tarefasAFazer.length,
                          itemBuilder: (context, index) {
                            final tarefa = _tarefasAFazer[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.teal.shade50,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      tarefa["titulo"],
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.check, color: Colors.teal),
                                    onPressed: () => _moverParaFeitas(tarefa),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // ABA: FEITAS
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: _tarefasFeitas.length,
                    itemBuilder: (context, index) {
                      final tarefa = _tarefasFeitas[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.done_all, color: Colors.grey),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                tarefa["titulo"],
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // TABBAR FIXA NO TOPO
          Positioned(
            top: 8,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.teal,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(vertical: 6),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 16),
                unselectedLabelStyle: TextStyle(fontSize: 14),
                tabs: [
                  Tab(text: 'A FAZER'),
                  Tab(text: 'FEITAS'),
                ],
              ),
            ),
          ),
        ],
      ),

      // BOTÃO FLUTUANTE (Adicionar tarefa)
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarTarefa,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),

      // BARRA DE NAVEGAÇÃO INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.teal,
        items: [
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
