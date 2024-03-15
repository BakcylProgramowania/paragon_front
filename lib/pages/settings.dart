import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart';
import 'package:paragon_front/default/default_widgets.dart';
import 'package:paragon_front/pages/setting.dart';
import 'package:paragon_front/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ustawienia"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {Navigator.of(context).pop();},
          color: AppColors.primaryColor,
        ),
        actions: [IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return MainPage();
            }));
          },
          color: AppColors.primaryColor,
        )]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            DefaultTextField(onChanged: (_) {}),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  const Text("Ustawienia ogólne", style: TextStyle(color: AppColors.greyText)),
                  const SettingTile(title: "Nazwa użytkownika", icon: Icons.alternate_email, page: SettingPage(
                    title: "Nazwa użytkownika",
                    child: Column(
                      children: [
                        DefaultTextField(suffixIcon: null, labelText: "Obecna nazwa użytkownika"),
                        SizedBox(height: 10),
                        DefaultTextField(suffixIcon: null, labelText: "Nowa nazwa użytkownika"),
                      ]
                    )
                  )),
                  const SettingTile(title: "E-mail", icon: Icons.email, page: SettingPage(
                    title: "Email",
                    child: Column(
                      children: [
                        DefaultTextField(suffixIcon: null, labelText: "Obecny email"),
                        SizedBox(height: 10),
                        DefaultTextField(suffixIcon: null, labelText: "Nowy email"),
                        SizedBox(height: 10),
                        DefaultTextField(suffixIcon: null, labelText: "Powtórz email"),
                      ]
                    )
                  )),
                  SettingTile(title: "Zmień hasło", icon: Icons.security, page: SettingPage(
                    title: "Zmień hasło",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hasło musi zawierać co najmniej 6 znaków, w tym cyfry, litery i znaki specjalne (!\$@%)"),
                        const SizedBox(height: 10),
                        const DefaultTextField(suffixIcon: null, labelText: "Obecne hasło"),
                        const SizedBox(height: 10),
                        const DefaultTextField(suffixIcon: null, labelText: "Nowe hasło"),
                        const SizedBox(height: 10),
                        const DefaultTextField(suffixIcon: null, labelText: "Powtórz hasło"),
                        const SizedBox(height: 10),
                        TextButton(onPressed: () {}, style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor), child: const Text("Nie pamiętasz hasła?"))
                      ]
                    )
                  )),
                  const Text("Inne", style: TextStyle(color: AppColors.greyText)),
                  SettingTile(title: "Tryb ciemny", icon: Icons.dark_mode, page: SettingPage(
                    title: "Tryb ciemny",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioListTile(title: const Text("Wł."), value: null, groupValue: null, onChanged: (_) {}, activeColor: AppColors.primaryColor),
                        RadioListTile(title: const Text("Wył."), value: null, groupValue: null, onChanged: (_) {}, activeColor: AppColors.primaryColor),
                        RadioListTile(title: const Text("System"), value: null, groupValue: null, onChanged: (_) {}, activeColor: AppColors.primaryColor),
                        const Text("Jeżeli wybierzesz opcję System, PARAGON automatycznie dostosuje wygląd na podstawie ustawień systemowych urządzenia"),
                      ]
                    )
                  )),
                  SettingTile(title: "Karta", icon: Icons.credit_card, page: SettingPage(
                    title: "Karta",
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.credit_card),
                          label: const Text("Dodaj kartę"),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                            foregroundColor: AppColors.defaultTextColor
                          ),
                        )
                      ]
                    )
                  )),
                ]
              )
            )
          ]
        )
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget page;
  const SettingTile({super.key, required this.title, required this.icon, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.greyAccent),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}