import 'package:flutter/material.dart';
import 'colors.dart';
import 'pages/signIn.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

// dsad
// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  String login = "";
  String password = "";
  postData() async {
    var response = http
        .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
      "id": 1.toString(),
      "login": login,
      "password": password,
    });
  }

  @override
  State<MyHomePage> createState() => Login();
}

class Login extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var home = MyHomePage();
  final TextEditingController _textController = TextEditingController();
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
                          color: AppColors.grayAccent, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: AppColors.grayAccent,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(15)),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Hasło",
                      labelStyle: const TextStyle(
                          color: AppColors.grayAccent, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor)),
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
                      if (_textController.text.isNotEmpty) {
                        myValue = _textController.text;
                        _textController.text = home.login;
                      } else {
                        myValue = 'Pole tekstowe nie może być puste.';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(myValue),
                        ),
                      );
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
                // Przenoszenie na nową stronę po kliknięciu
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
                      style: TextStyle(color: AppColors.grayAccent),
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
                      color: AppColors.grayAccent,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'lub',
                      style: TextStyle(color: AppColors.grayAccent),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.grayAccent,
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
