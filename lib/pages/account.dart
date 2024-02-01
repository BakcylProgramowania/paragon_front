import 'package:flutter/material.dart';
import 'package:paragon_front/pages/default_widgets.dart';
import '/colors.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Stack(children: [
      Row(children: [
        IconButton(
          padding: const EdgeInsets.only(left: 380, top: 25),
          onPressed: () {
            // Przenoszenie na nową stronę po kliknięciu
            /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ParagonApp()),
            );*/
          },
          icon: const Icon(
            Icons.cancel,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ]),
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const DefaultLogo(),
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
                  color: AppColors.grayAccent,
                  fontSize: 20),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child: ElevatedButton.icon(
                  label: const Text(
                      style:
                          TextStyle(color: AppColors.grayAccent, fontSize: 30),
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
                    color: (AppColors.grayAccent),
                    size: 30,
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                width: 350,
                child: ElevatedButton.icon(
                  label: const Text(
                    style: TextStyle(color: AppColors.grayAccent, fontSize: 30),
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
                    color: (AppColors.grayAccent),
                    size: 30,
                  ),
                )),
          ]))
    ]));
  }
}
