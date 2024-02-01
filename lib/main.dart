import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:paragon_front/pages/default_widgets.dart';
import 'package:paragon_front/pages/signIn.dart';
import 'colors.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(const ParagonApp());
}

class ParagonApp extends StatelessWidget {
  const ParagonApp({super.key});

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
      home: ParagonLoginPage(),
    );
  }
}

// dsad
// ignore: must_be_immutable
class ParagonLoginPage extends StatefulWidget {
  ParagonLoginPage({super.key});

  String login = "";
  String password = "";
  postData() async {
    try {
      var response = await http
          .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
        "id": 1.toString(),
        "login": login,
        "password": password,
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  State<ParagonLoginPage> createState() => Login();
}

class Login extends State<ParagonLoginPage> {
  final _formKey = GlobalKey<FormState>();
  var home = ParagonLoginPage();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String myValue = '';
  String holder = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const DefaultLogo(),
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
                /*TextFormField(
                  controller: _loginController,
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
                  autofillHints: const [AutofillHints.email],
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),*/
                DefaultTextFormField(
                  signinController: _loginController,
                  title: 'Email',
                  coma: false,
                ),
                const SizedBox(height: 20.0),
                DefaultTextFormField(
                  signinController: _passController,
                  title: 'Hasło',
                  coma: true,
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
                      final form = _formKey.currentState!;
                      if (form.validate()) {
                        final email = _loginController.text;
                        home.login = _loginController.text;
                        home.password = _passController.text;
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            content: Text('Your email is $email'),
                          ));
                      }
                      /*if (_textController.text.isNotEmpty &&
                          _passController.text.isNotEmpty) {
                        home.login = _LogintController.text;
                        home.password = _PassController.text;
                      } else {
                        myValue = 'Pole tekstowe nie może być puste.';
                      }*/
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(myValue),
                      //   ),
                      // );
                      home.postData();
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
