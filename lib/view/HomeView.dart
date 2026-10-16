import 'package:flutter/material.dart';
import 'package:flutter_web_mobile/view/ListaConversaView.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _currentIndex = 0;

  // Lista com o conteúdo de cada aba adaptada ao novo estilo
  final List<Widget> _screens = [
    const Center(child: Text('Feed / Linha do Tempo', style: TextStyle(color: Colors.white, fontSize: 24))),
    const Center(child: Text('Pesquisar', style: TextStyle(color: Colors.white, fontSize: 24))),
    const Center(child: Text('Novo Post', style: TextStyle(color: Colors.white, fontSize: 24))),
    const Center(child: Text('Reels', style: TextStyle(color: Colors.white, fontSize: 24))),
    const Center(child: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Aplicamos o mesmo gradiente de fundo da LoginView
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF071835), Color(0xFF0A2A55)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- AppBar Customizada (Estilo Transparente) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Instagram Clone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListaConversaView(),
                          ),
                        ).then((_) {
                          // O código dentro do .then() é executado quando o utilizador 
                          // voltar da página de conversas. Se precisar de atualizar 
                          // alguma informação no ecrã atual, pode colocar aqui.
                        });
                      },
                    ),

                  ],
                ),
              ),
              
              // --- Conteúdo Principal Preservando Estados ---
              Expanded(
                child: IndexedStack(
                  index: _currentIndex,
                  children: _screens,
                ),
              ),
            ],
          ),
        ),
      ),
      
      // --- BottomNavigationBar Customizada ---
      // Envolvemos em um Container para estilizar o fundo idêntico aos inputs
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF071835), // Fundo base escuro
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.1), // Linha superior suave
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent, // Deixa o Container controlar a cor
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue, // Azul vibrante idêntico ao botão "Entrar"
          unselectedItemColor: Colors.white70, // Ícones inativos combinando com as labels do Login
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: 'Novo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_outlined),
              activeIcon: Icon(Icons.movie_filter),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
