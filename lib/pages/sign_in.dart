import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _gender = '';

  // Initially password is obscure
  bool _passwordVisible = false;

  double generalFont = 10.0;
  String inputCheck = '';
  bool notifEmail = true;
  bool notifWpp = true;
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            maxLength: 20,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nome',
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: generalFont,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            controller: _birthController,
                            maxLength: 10,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Data de Nascimento',
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: generalFont,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            maxLength: 10,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: generalFont,
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passController,
                            maxLength: 10,
                            obscureText:
                                !_passwordVisible, //This will obscure text dynamically
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: generalFont,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Gênero: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: generalFont,
                          ),
                        ),
                        Spacer(),
                        Radio(
                          value: 'm',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            _gender = value!;
                          },
                        ),
                        Text(
                          'Masculino',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: generalFont,
                          ),
                        ),
                        Spacer(),
                        Radio(
                          value: 'f',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            _gender = value!;
                          },
                        ),
                        Text(
                          'Feminino',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: generalFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Notificações:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: generalFont,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: SwitchListTile(
                              title: Text(
                                'E-mail',
                                style: TextStyle(fontSize: generalFont),
                              ),
                              value: notifEmail,
                              onChanged: (bool val) {
                                setState(
                                  () {
                                    notifEmail = val;
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: SwitchListTile(
                              title: Text(
                                'Whatsapp',
                                style: TextStyle(fontSize: generalFont),
                              ),
                              value: notifWpp,
                              onChanged: (bool val) {
                                setState(
                                  () {
                                    notifWpp = val;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.deepOrange),
                        ),
                        onPressed: () {
                          _saveData();
                          Navigator.of(context).pop();
                        },
                        child: Text('Registrar',
                            style: TextStyle(fontSize: generalFont))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'FontSize:',
                          style: TextStyle(fontSize: generalFont),
                        ),
                        Slider(
                          value: generalFont,
                          min: 10.0,
                          max: 18.0,
                          label: generalFont.toString(),
                          divisions: 8,
                          onChanged: (double val) {
                            setState(() {
                              generalFont = val;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    String name = _nameController.text;
    await prefs.setString("name", name);

    String birth = _birthController.text;
    await prefs.setString("birth", birth);

    String email = _emailController.text;
    await prefs.setString("email", email);

    String pass = _passController.text;
    await prefs.setString("pass", pass);

    String gender = _gender;
    await prefs.setString("gender", gender);
  }
}

