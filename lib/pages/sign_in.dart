// ignore_for_file: unused_local_variable, avoid_print, file_names

import 'package:flutter/material.dart';
import '/default/colors.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

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
  Future<void> fetchData(
      String name, String email, String password) async {
    final url = Uri.parse("https://paragon.wroc.ovh" "/register"); // Zaktualizuj URL
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

      if (response.statusCode == 200 || response.statusCode == 201 ) {
        print("Sukces: ${response.body}");
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
      fetchData(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );
    }
  }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 80,
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
                                    color: AppColors.grayAccent, fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.grayAccent,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15))),
                        const SizedBox(height: 20.0),
                        TextFormField(
                            controller: _secondNameCotroller,
                            decoration: InputDecoration(
                                labelText: "Nazwisko",
                                labelStyle: const TextStyle(
                                    color: AppColors.grayAccent, fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.grayAccent,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15))),
                        const SizedBox(height: 20.0),
                        TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: const TextStyle(
                                    color: AppColors.grayAccent, fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.grayAccent,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15))),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: "Hasło",
                              labelStyle: const TextStyle(
                                  color: AppColors.grayAccent, fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.grayAccent,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(15)),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Powtórz hasło",
                              labelStyle: const TextStyle(
                                  color: AppColors.grayAccent, fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.grayAccent,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(15)),
                          obscureText: true,
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
          ),
        ],
      ),
    );
  }
}