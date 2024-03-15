// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

// ignore: unused_import


import 'package:flutter/material.dart';
import '/default/colors.dart';
import 'pages/sign_in.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'pages/main_page.dart';
import './pages/history.dart';
import './pages/friends_list.dart';
import 'nav_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => MainPage(),
        '/history': (context) => const HistoryPage(),
        '/friends': (context) =>  const FriendsList(),
        // inne trasy
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: _Login(),
    );
  }
}
Future<void> storeAuthTokenLocally(String authToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('authToken', authToken);
}
Future<String?> getAuthTokenLocally() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');
}

// dsad
// ignore: must_be_immutable
class _Login extends StatefulWidget {
  late String? authToken = "";
  String login = "";
  String password = "";

 Future<void> postData(BuildContext context) async {
  final url = Uri.https("paragon.wroc.ovh", "/login");

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': login, 'password': password}),
    );

    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {

      final String? authHeader = response.headers['authorization'];
                            
      // authToken = authHeader;
      print(authHeader);
       print('Response headers: ${response.headers}');
       print('Content-Type header: ${response.headers['Authorization']}');
      // print(authToken);
        if (authHeader != null) {
          final String authToken = authHeader;
          storeAuthTokenLocally(authToken);
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavigationExample()),
          );
        } else {
          // Brak nagłówka autoryzacji w odpowiedzi serwera
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Błąd autentykacji: Niepoprawny format nagłówka "Authorization" w odpowiedzi serwera'),
              backgroundColor: Colors.red,
            ),
          );
        }
    } else {
      // Błędne dane logowania
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Niepoprawne dane logowania'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (error) {
    print("Błąd: $error");
    // Obsługa błędów, np. wyświetlenie odpowiedniego komunikatu
  }
}
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.https("paragon.wroc.ovh", "/login"),
        headers: {'Authorization': '$authToken'},
      );
      print("AuthToken: $authToken");
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    } catch (error) {
      print("Błąd: $error");
    }
  }

  @override
  State<_Login> createState() => LoginState();
}

class LoginState extends State<_Login> {
  final _formKey = GlobalKey<FormState>();
  var home = _Login();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String myValue = '';
  String holder = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              child: const Text('Zaloguj sie',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
          Align(
            alignment: FractionalOffset.topLeft,
            child: Container(
              width: 120,
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
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(
                          color: AppColors.greyAccent, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: AppColors.greyAccent,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(15)),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                      labelText: "Hasło",
                      labelStyle: const TextStyle(
                          color: AppColors.greyAccent, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: AppColors.greyAccent,
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
                      if (_textController.text.isNotEmpty &&
                          _passController.text.isNotEmpty) {
                        home.login = _textController.text;
                        home.password = _passController.text;
                        home.postData(context);
                      } else {
                        myValue = 'Pole tekstowe nie może być puste.';
                      }
                      
                    },
                    child: const Text(
                      'Zaloguj się',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Nie masz konta?',
                      style: TextStyle(color: AppColors.greyAccent),
                    ),
                    TextSpan(
                      text: ' Zarejestruj się.',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 30),
              width: 350,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      width: 20,
                      color: AppColors.greyAccent,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'lub',
                      style: TextStyle(color: AppColors.greyAccent),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.greyAccent,
                    ),
                  ),
                ],
              )),
          Container(
              margin: const EdgeInsets.only(top: 30),
              width: 330,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.google,
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          width: 20,
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        const Text(
                          'Zaloguj się z Google',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        )
                      ],
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.fb,
                    ),
                    child: const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Text(
                          'Zaloguj się z Facebook',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 16),
                        )
                      ],
                    )),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
