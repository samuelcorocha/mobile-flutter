import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
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
      ),
      drawer: const Drawer(),
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
                            keyboardType: TextInputType.text,
                            maxLength: 20,
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
                            keyboardType: TextInputType.datetime,
                            maxLength: 10,
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
                            keyboardType: TextInputType.emailAddress,
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
                            keyboardType: TextInputType.text,
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
                            maxLength: 20,
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
                          groupValue: _selecionado(),
                          onChanged: (Object? value) {},
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
                          groupValue: _selecionado(),
                          onChanged: (Object? value) {},
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Minha conta',
          ),
        ],
      ),
    );
  }
}

_selecionado() {}
