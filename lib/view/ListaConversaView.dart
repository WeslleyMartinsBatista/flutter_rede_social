import 'package:flutter/material.dart';
import 'package:flutter_web_mobile/service/ChatService.dart';
import 'package:flutter_web_mobile/model/UserModel.dart';

class ListaConversaView extends StatefulWidget {
  @override
  _ListaConversaViewState createState() => _ListaConversaViewState();
}

class _ListaConversaViewState extends State<ListaConversaView> {
  final String idUsuarioLogado = "1"; // ID do Weslley (exemplo)
  final ChatService _chatService = ChatService();
  
  List<UserModel> _conversas = [];

  @override
  void initState() {
    super.initState();
    _atualizarListaConversas();
  }

  void _atualizarListaConversas() {
    setState(() {
      _conversas = _chatService.obterConversasOrdenadas(idUsuarioLogado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, 
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
              // --- AppBar Customizada (Estilo Transparente idêntico à Home) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Mensagens',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      onPressed: _atualizarListaConversas,
                    ),
                  ],
                ),
              ),
              
              // --- Lista de Conversas Customizada ---
              Expanded(
                child: _conversas.isEmpty
                    ? const Center(
                        child: Text(
                          "Nenhuma conversa encontrada.",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        itemCount: _conversas.length,
                        itemBuilder: (context, index) {
                          final contacto = _conversas[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            decoration: BoxDecoration(
                              // Fundo sutil para cada item da lista (estilo inputs do design original)
                              color: Colors.white.withValues(alpha: 0.03),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              leading: CircleAvatar(
                                radius: 26,
                                // Fundo azul vibrante idêntico ao botão "Entrar" e itens ativos
                                backgroundColor: Colors.blue, 
                                child: Text(
                                  contacto.nome.substring(0, 1).toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              title: Text(
                                contacto.nome,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: const Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Toque para abrir a conversa",
                                  style: TextStyle(
                                    color: Colors.white70, // Tom mais suave inativo
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.chevron_right,
                                color: Colors.white30,
                              ),
                              onTap: () {
                                // Próximo passo: Abrir o chat privado.
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
