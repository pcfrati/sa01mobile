import 'package:flutter/material.dart'; // Aqui estamos importando o Flutter

/// Tela principal de lista de tarefas
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key}); // Essa linha cria a tela de lista de tarefas, e "super.key" é uma chave que ajuda a identificar a tela

  @override
  State<TaskListScreen> createState() => _TaskListScreenState(); // estamos dizendo ao Flutter que queremos um lugar para armazenar o "estado" dessa tela (o que vai mudar nela)
}

class _TaskListScreenState extends State<TaskListScreen> with TickerProviderStateMixin {
  final TextEditingController _tarefaController = TextEditingController(); // Controlador que cuida do que você digita no campo de texto
  List<Map<String, dynamic>> _tarefasFeitas = []; // Lista de tarefas que já foram feitas
  List<Map<String, dynamic>> _tarefasAFazer = []; // Lista de tarefas que você ainda precisa fazer

  late TabController _tabController; //0 controla as abas (como se fossem "páginas" na sua tela)

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this); // configura duas abas: "A FAZER" e "FEITAS"
    super.initState(); // chama o método initState() da classe base State, garante que tudo esteja funcionando direitinho
  }

  // Função que adiciona uma nova tarefa à lista
  void _adicionarTarefa() {
    if (_tarefaController.text.trim().isNotEmpty) { // Verifica se você escreveu alguma coisa
      setState(() {
        _tarefasAFazer.add({"titulo": _tarefaController.text, "concluida": false}); // Adiciona sua nova tarefa na lista de "A FAZER"
        _tarefaController.clear(); // Limpa o campo onde você digitou
      });
    }
  }

  // Função que move uma tarefa para a lista de "feitas"
  void _moverParaFeitas(Map<String, dynamic> tarefa) {
    setState(() {
      _tarefasAFazer.remove(tarefa); // Remove a tarefa de "A FAZER"
      _tarefasFeitas.add(tarefa); // Coloca a tarefa na lista de "FEITAS"
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
              onTap: () => Navigator.pushNamed(context, '/dashboard'), // Vai para a tela do dashboard
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
        title: Text("HECHO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), 
        actions: [Icon(Icons.notifications), SizedBox(width: 16)], 
      ),

      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60), // Ajusta o conteúdo para que ele não fique embaixo da app bar
            child: TabBarView(
              controller: _tabController,
              children: [
                // ABA "A FAZER"
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // CAMPO DE TEXTO onde você digita uma nova tarefa
                      TextField(
                        controller: _tarefaController,
                        decoration: InputDecoration(
                          labelText: "Digite uma tarefa",
                          border: OutlineInputBorder(), // Borda ao redor do campo
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal), // Cor da borda quando você está digitando
                          ),
                        ),
                      ),
                      SizedBox(height: 12), // Dá um espacinho entre o campo de texto e a lista de tarefas

                      // LISTA de tarefas a fazer
                      Expanded(
                        child: ListView.builder(
                          itemCount: _tarefasAFazer.length, // Quantas tarefas há para exibir
                          itemBuilder: (context, index) {
                            final tarefa = _tarefasAFazer[index]; // Pega a tarefa que está na posição "index"
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
                                    icon: Icon(Icons.check, color: Colors.teal), // Ícone para marcar como feita
                                    onPressed: () => _moverParaFeitas(tarefa), // Mover a tarefa para "feitas"
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

                // ABA "FEITAS"
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: _tarefasFeitas.length, // Conta quantas tarefas já foram feitas
                    itemBuilder: (context, index) {
                      final tarefa = _tarefasFeitas[index]; // Pega a tarefa concluída
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
                                  decoration: TextDecoration.lineThrough, // Risca o texto para mostrar que está feito
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

          // Abas que ficam fixas no topo da tela
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
                  Tab(text: 'A FAZER'), // Aba para tarefas pendentes
                  Tab(text: 'FEITAS'), // Aba para tarefas já concluídas
                ],
              ),
            ),
          ),
        ],
      ),

      // BOTÃO FLUTUANTE (botão redondo para adicionar uma nova tarefa)
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarTarefa, // Chama a função para adicionar uma nova tarefa
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: Icon(Icons.add), // Ícone de adição (+)
      ),

      // BARRA DE NAVEGAÇÃO INFERIOR (com ícones para tarefas e configurações)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Índice da opção selecionada
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.white70, 
        backgroundColor: Colors.teal, 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list), // Ícone de lista de tarefas
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Ícone de configurações
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
