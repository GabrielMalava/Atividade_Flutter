import 'package:flutter/material.dart';
import '../models/class_model.dart';
import '../services/api_service.dart';
import 'class_detail_screen.dart';
import 'wiki_screen.dart';
import 'register_service_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  int _selectedIndex = 0;

  // Função para navegar até a RegisterServiceScreen e atualizar a WikiScreen ao retornar
  Future<void> _navigateToRegisterService(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterServiceScreen()),
    );

    if (result == true) {
      setState(() {}); // Atualiza a tela para exibir o novo serviço na WikiScreen
    }
  }

  List<Widget> _screens = [
    HomeContent(), // Conteúdo da tela principal
    WikiScreen(),  // Tela Wiki que exibe os serviços registrados
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App de Serviços')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Serviços',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () => _navigateToRegisterService(context),
              child: Icon(Icons.add),
              tooltip: 'Registrar Serviço',
            )
          : null,
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bem-vindo ao App de Serviços!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Este aplicativo foi criado para facilitar a compra e venda de serviços, oferecendo uma plataforma amigável e prática. Com ele, você pode:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          _buildFeatureItem(Icons.search, 'Explorar uma lista de serviços disponíveis'),
          _buildFeatureItem(Icons.add, 'Registrar novos serviços facilmente'),
          _buildFeatureItem(Icons.book, 'Acessar informações detalhadas sobre serviços no Wiki'),
          SizedBox(height: 20),
          Text(
            'Para começar, explore os serviços ou registre uma nova oferta!',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
