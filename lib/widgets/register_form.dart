import 'package:apirest/utils/responsive.dart';
import 'package:apirest/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '', _username = '';
  _submit() {
    final isOk = _formKey.currentState.validate();
    print("form isOk $isOk");
    if (isOk) {}
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
        bottom: 30,
        child: Container(
            constraints: BoxConstraints(
              maxWidth: responsive.isTablet ? 430 : 360,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputText(
                    keyboardType: TextInputType.text,
                    label: 'Nombre de Usuario',
                    fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                    onChanged: (text) {
                      _username = text;
                    },
                    validator: (text) {
                      if (text.trim().length < 5) {
                        return "Nombre de Usuario Invalido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: responsive.dp(2),
                  ),
                  InputText(
                    keyboardType: TextInputType.emailAddress,
                    label: 'Correo Electrónico',
                    fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                    onChanged: (text) {
                      _email = text;
                    },
                    validator: (text) {
                      if (text.contains("@")) {
                        return "Correo Electrónico Invalido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: responsive.dp(2),
                  ),
                  InputText(
                    keyboardType: TextInputType.visiblePassword,
                    label: 'Contraseña',
                    fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                    onChanged: (text) {
                      _password = text;
                    },
                    validator: (text) {
                      if (text.trim().length < 6) {
                        return "Contraseña Invalida";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: responsive.dp(5),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.dp(1.5),
                        ),
                      ),
                      onPressed: this._submit,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(
                    height: responsive.dp(2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Ya tengo una Cuenta?",
                        style: TextStyle(fontSize: responsive.dp(1.5)),
                      ),
                      MaterialButton(
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: responsive.dp(1.5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: responsive.dp(10)),
                ],
              ),
            )));
  }
}
