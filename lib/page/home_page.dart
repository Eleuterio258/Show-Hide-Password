import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Hide Password'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: emailValidation,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: IconButton(
                      icon: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordView,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child: Text("Eviar"))
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String emailValidation(String value) {
    if (value.isEmpty) {
      return "*Campo Required";
    }
    if (value.length < 5) {
      return "O Valor minimo e de 5 letras";
    }
    if (value.length > 15) {
      return "O Valor miximo e de 15 letras";
    }

    return null;
  }

  void _submit() {
    final isValid = _formkey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState.save();
  }
}
