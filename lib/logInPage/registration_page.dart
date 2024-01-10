import 'package:flutter/material.dart';

import '../routes/app_roures.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  static const registration = '/registration';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _hidePass = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _groupController = TextEditingController();
  final _professionController = TextEditingController();
  final _idController = TextEditingController();
  final _iinController = TextEditingController();
  final _photoLinkController = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _groupController.dispose();
    _professionController.dispose();
    _idController.dispose();
    _iinController.dispose();
    _photoLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(context, controller),
    );
  }

  Widget buildBody(BuildContext context, TextEditingController controller) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        const Positioned(
            top: 30,
            right: 10,
            child: Row(
              children: [
                Text(
                  "KZ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                  size: 50,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 100.0, bottom: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Тіркелу",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null; // Return null if the input is valid.
                    },
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "Аты-жөнің толтыру маңызды" : null,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Аты-жөні',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _hidePass,
                    maxLength: 8,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "Құпия сөзді жазыңыз" : null,
                      suffixIcon: IconButton(
                          icon: Icon(_hidePass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _hidePass = !_hidePass;
                            });
                          }),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Құпия сөз',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _groupController,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "Тобыңызды жазыңыз" : null,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Тобы',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _professionController,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "Мамандық жазу міндетті" : null,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Мамандық',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _idController,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "ID Can't Be Empty" : null,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'ID',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _iinController,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "ИИН жазыңыз" : null,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'ИИН',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _photoLinkController,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      errorText: _validate ? "Фото сілтеме еңгізіңіз" : null,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Фото сілтемесі',
                      hintStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _validate = _nameController.text.isEmpty;
                      _validate = _passwordController.text.isEmpty;
                      _validate = _groupController.text.isEmpty;
                      _validate = _professionController.text.isEmpty;
                      _validate = _idController.text.isEmpty;
                      _validate = _iinController.text.isEmpty;
                      _validate = _photoLinkController.text.isEmpty;
                    });

                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.profile,
                        arguments: [
                          _photoLinkController.text,
                          _idController.text,
                          _nameController.text,
                          _groupController.text,
                          _professionController.text,
                          _iinController.text
                        ],
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Тіркелу',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
