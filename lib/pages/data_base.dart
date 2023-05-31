import 'package:flutter/material.dart';
import 'package:lddm_projects/pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  _DatabasePage createState() => _DatabasePage();
}

class _DatabasePage extends State<DatabasePage> {
  String _name = '';

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _name = prefs.getString("name") ?? "Sem valor";
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Dados'),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const Drawer(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Banco de Dados',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Minha conta',
          ),
        ],
      ),
    );
  }
}
