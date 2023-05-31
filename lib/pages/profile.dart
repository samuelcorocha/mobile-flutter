import 'package:flutter/material.dart';
import 'package:lddm_projects/pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String _name = '';
  String _birth = '';
  String _email = '';
  String _gender = '';

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _name = prefs.getString("name") ?? "Sem valor";
      _birth = prefs.getString("birth") ?? "Sem valor";
      _email = prefs.getString("email") ?? "Sem valor";
      _gender = prefs.getString("gender") ?? "Sem valor";
      switch (_gender) {
        case 'm':
          _gender = 'Masculino';
          break;
        case 'f':
          _gender = 'Feminino';
          break;
        default:
      }
    });
  }

  @override
  void initState() {
    _loadData();
    print(_name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nome: $_name',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Data de Nascimento: $_birth',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'E-mail: $_email',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Genêro: $_gender',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
