import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  _DatabasePage createState() => _DatabasePage();
}

class _DatabasePage extends State<DatabasePage> {
  _restoreDatabase() async {
    final pathdb = await getDatabasesPath();
    final localdb = join(pathdb, "database.db");
    Database database = await openDatabase(localdb, version: 1,
        onCreate: (Database db, int version) async {
      String sql = "CREATE TABLE IF NOT EXISTS users("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "name VARCHAR, age INTEGER)";
      await db.execute(sql);
    });
    return database;
  }

  _saveData(String name, int age) async {
    Database db = await _restoreDatabase();
    print("Aberto " + db.toString());
    Map<String, dynamic> userData = {
      "name": name,
      "age": age,
    };
    int id = await db.insert("users", userData);
    print("Salvo: $id ");
  }

  _listUsers() async {
    Database db = await _restoreDatabase();
    String sql = "SELECT * FROM users";
    List users = await db.rawQuery(sql);
    for (var user in users) {
      print("ID: " +
          user['id'].toString() +
          "\tNome: " +
          user['name'] +
          "\tIdade: " +
          user['age'].toString());
    }
  }

  _listAnUser(int id) async {
    Database db = await _restoreDatabase();
    List users = await db.query("users",
        columns: ["id", "name", "age"], where: "id = ?", whereArgs: [id]);
    for (var user in users) {
      print("ID: " +
          user['id'].toString() +
          "\tNome: " +
          user['name'] +
          "\tIdade: " +
          user['age'].toString());
    }
  }

  _excludeAnUser(int id) async {
    Database db = await _restoreDatabase();
    int res = await db.delete("users", where: "id = ?", whereArgs: [id]);
    print("Itens excluidos: " + res.toString());
  }

  _updateAnUser(int id, String name, int age) async {
    Database db = await _restoreDatabase();
    Map<String, dynamic> userData = {
      "name": name,
      "age": age,
    };
    int res =
        await db.update("users", userData, where: "id = ?", whereArgs: [id]);
    print("Itens atualizados: " + res.toString());
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _id,
                      decoration: const InputDecoration(
                        labelText: "ID",
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: "name",
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _age,
                      decoration: const InputDecoration(
                        labelText: "age",
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _saveData(_name.text, int.parse(_age.text));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.deepOrange),
                    ),
                    child: const Text("Salvar um usuário"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _listUsers();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.deepOrange),
                    ),
                    child: const Text("Listar todos os usuários"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _listAnUser(int.parse(_id.text));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.deepOrange),
                    ),
                    child: const Text("Listar um usuário"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _updateAnUser(int.parse(_id.text), _name.text,
                          int.parse(_age.text));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.deepOrange),
                    ),
                    child: const Text("Atualizar um usuário"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _excludeAnUser(int.parse(_id.text));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.deepOrange),
                    ),
                    child: const Text("Excluir um usuário"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
