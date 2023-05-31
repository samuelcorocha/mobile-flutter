import 'package:flutter/material.dart';
import 'package:lddm_projects/pages/profile.dart';
import 'package:lddm_projects/pages/data_base.dart';
import 'package:lddm_projects/pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
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
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(),
            DatabasePage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
