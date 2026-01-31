import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldUsing extends StatefulWidget {
  const TextFormFieldUsing({super.key});

  @override
  State<TextFormFieldUsing> createState() => _TextFormFieldUsingState();
}

class _TextFormFieldUsingState extends State<TextFormFieldUsing> {
  final _formKey = GlobalKey<FormState>();

  String _userName = '', _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Column(
          children: [
            TextFormField(
              //autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) {
                if (value!.length < 6) {
                  return 'İsim  6 da küçük olamaz';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'İsim',
                hintText: 'İsim Giriniz',
              ),
              onSaved: (newValue) {
                _userName = newValue!;
              },
            ),

            SizedBox(height: 10),

            TextFormField(
              keyboardType: TextInputType.emailAddress,

              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'Geçerli bir mail adresi giriniz';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
                hintText: 'E-mail Giriniz',
              ),
              onSaved: (newValue) {
                _email = newValue!;
              },
            ),

            SizedBox(height: 10),

            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              // autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) {
                if (value!.length < 6) {
                  return 'Şifre Giriniz';
                } else {
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Şifre',
                hintText: 'Şifre Giriniz',
              ),
              onSaved: (newValue) {
                _password = newValue!;
              },
            ),
            SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  child: Text("Temizle"),
                ),
                ElevatedButton(
                  onPressed: () {
                    var validate = _formKey.currentState!.validate();
                    if (validate) {                     
                      _formKey.currentState!.save();
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Tüm veriler doğrulanmştır(Username $_userName Email $_email)"),
                        ),
                          
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Tüm veriler doğrulanmış olmalı tekrar dene",
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Kaydet"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
