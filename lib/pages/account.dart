import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart';
import 'package:paragon_front/pages/sign_in.dart';

//import 'package:paragon_front/default/default_widgets.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.primaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            },
          ),
        ]),
        body: Stack(children: [
          /* Row(children: [
        /*IconButton(
          padding: const EdgeInsets.only(left: 380, top: 25),
          onPressed: () {
             //Przenoszenie na nową stronę po kliknięciu
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          icon: const Icon(
            Icons.cancel,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),*/
      ]),*/
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                Image.asset(
                  'assets/user.png',
                  width: 150,
                  height: 160,
                ),
                const Text(
                  'nazwa uzytkownika',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.defaultTextColor,
                      fontSize: 20),
                ),
                const Text(
                  'email@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyAccent,
                      fontSize: 20),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 350,
                    child: ElevatedButton.icon(
                      label: const Text(
                          style: TextStyle(
                              color: AppColors.greyAccent, fontSize: 30),
                          'Portfel'),
                      onPressed: () {
                        // Przenoszenie na nową stronę po kliknięciu
                        /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ParagonApp()),
                    );*/
                      },
                      icon: const Icon(
                        Icons.account_balance_wallet,
                        color: (AppColors.greyAccent),
                        size: 30,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 350,
                    child: ElevatedButton.icon(
                      label: const Text(
                        style: TextStyle(
                            color: AppColors.greyAccent, fontSize: 30),
                        'Ustawienia',
                      ),
                      onPressed: () {
                        // Przenoszenie na nową stronę po kliknięciu
                        /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ParagonApp()),
                    );*/
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: (AppColors.greyAccent),
                        size: 30,
                      ),
                    )),
              ]))
        ]));
  }
}
