import 'package:apirest/utils/responsive.dart';
import 'package:apirest/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                      ),
                    )),
                    child: Row(
                      children: [
                        Expanded(
                          child: InputText(
                            label: 'Contraseña',
                            obscureText: true,
                            borderEnabled: false,
                            fontSize: responsive.dp(
                              responsive.isTablet ? 1.2 : 1.4,
                            ),
                            onChanged: (text) {
                              _password = text;
                            },
                            validator: (text) {
                              if (text.trim().length == 0) {
                                return "Contraseña Invalida";
                              }
                              return null;
                            },
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {},
                          child: Text(
                            'Olvidó su Contraseña',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive
                                  .dp(responsive.isTablet ? 1.2 : 1.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: responsive.dp(5),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Iniciar Sesión",
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
                        "¿No tienes una Cuenta?",
                        style: TextStyle(fontSize: responsive.dp(1.5)),
                      ),
                      MaterialButton(
                        child: Text(
                          'Registrate',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: responsive.dp(1.5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
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
