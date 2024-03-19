// ignore_for_file: unused_local_variable, avoid_print, file_names

import 'package:flutter/material.dart';
import '/default/colors.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import "main_page.dart";
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late TextEditingController _nameController;
  late TextEditingController _secondNameCotroller;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _secondNameCotroller = TextEditingController();
  }

  // Metoda do wysyłania danych
  Future<void> fetchData(String name, String email, String password) async {
    final url =
        Uri.parse("https://paragon.wroc.ovh" "/register"); // Zaktualizuj URL
    print("work");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': name,
          'email': email,
          'password': password,
        }),
      );
      print(email);
      print(password);
      print(name);
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Sukces: ${response.body}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        print("Błąd: ${response.statusCode}");
        print("Błąd: ${response.body}");
      }
    } catch (error) {
      print("Błąd: $error");
    }
  }

  // Metoda do przetwarzania danych
  void postData() async {
    if (formKey.currentState!.validate()) {
      var fetchData2 = fetchData(
        _nameController.text,
        _passwordController.text,
        _emailController.text,
      );
    }
  }

  bool _isVisible = false;
  bool _isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: const Text('Rejestracja'),
              centerTitle: true,
            ),
          ),
          Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'Para',
                          style: TextStyle(color: AppColors.primaryColor)),
                      TextSpan(
                          text: 'gon',
                          style: TextStyle(color: AppColors.defaultTextColor)),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.only(left: 50),
                    child: const Text('Zarejestruj sie',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ))),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 50),
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35, left: 50, right: 50),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: "Imie",
                                labelStyle: const TextStyle(
                                    color: AppColors.greyAccent, fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.greyAccent,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15))),
                        const SizedBox(height: 20.0),
                        TextFormField(
                            controller: _secondNameCotroller,
                            decoration: InputDecoration(
                                labelText: "Nazwisko",
                                labelStyle: const TextStyle(
                                    color: AppColors.greyAccent, fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.greyAccent,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15))),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                  color: AppColors.greyAccent, fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.greyAccent,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(15)),
                          autofillHints: const [AutofillHints.email],
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                            controller: _passwordController,
                            obscureText: !_isVisible,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : const Icon(Icons.visibility_off,
                                          color: Colors.grey),
                                ),
                                labelText: "Hasło",
                                labelStyle: const TextStyle(
                                    color: AppColors.greyAccent, fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.greyAccent,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15)),
                            validator: (password) {
                              if (password!.length < 8) {
                                return 'Hasło powinno mieć co najmniej 8 znaków.';
                              } else if (!password.contains(RegExp(r'\d'))) {
                                return 'Hasło powinno mieć co najmniej 1 cyfrę.';
                              } else if (!password.contains(RegExp(r'[A-Z]'))) {
                                return 'Hasło powinno mieć co najmniej 1 dużą literę.';
                              } else if (!password.contains(RegExp(r'[a-z]'))) {
                                return 'Hasło powinno mieć co najmniej 1 małą literę.';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: !_isVisible2,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible2 = !_isVisible2;
                                  });
                                },
                                icon: _isVisible2
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(Icons.visibility_off,
                                        color: Colors.grey),
                              ),
                              labelText: "Powtórz hasło",
                              labelStyle: const TextStyle(
                                  color: AppColors.greyAccent, fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.greyAccent,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(15)),
                          validator: (reapedPassword) {
                            if (reapedPassword != _passwordController.text) {
                              return 'Źle wpisane hasło';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Container(
                          width: 400,
                          margin: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              padding: const EdgeInsets.all(13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () {
                              final form = formKey.currentState!;

                              /*if (form.validate()) {
                                final email = _emailController.text;
                                final password = _passwordController.text;
                              }*/

                              if (formKey.currentState!.validate()) {
                                postData();
                              }
                            },
                            child: const Text(
                              'Zarejestruj się',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
