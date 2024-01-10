import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static const login = '/login';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _hidePass = true;

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: buildBody(context, controller),
    );
  }

  Widget buildBody(BuildContext context, TextEditingController controller) {
    return Stack(
      children: [
        const Positioned(
            top: 30,
            right: 10,
            child: Row(
              children: [
                Text(
                  "KZ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 50,
                ),
              ],
            )),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Кіру",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _loginController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    errorText: _validate ? "Login Can't Be Empty" : null,
                    fillColor: Colors.white30,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Login',
                    hintStyle: const TextStyle(
                      color: Colors.white,
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
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    errorText: _validate ? "Password Can't Be Empty" : null,
                    suffixIcon: IconButton(
                        icon: Icon(_hidePass
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _hidePass = !_hidePass;
                          });
                        }),
                    fillColor: Colors.white30,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _validate = _loginController.text.isEmpty;
                    _validate = _passwordController.text.isEmpty;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 25,
      ),
      backgroundColor: Colors.white,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
