import 'package:flutter/material.dart';
import 'package:lddm_projects/pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
    print(_name);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bem vindo, $_name',
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }
}
