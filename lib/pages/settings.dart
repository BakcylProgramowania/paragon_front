import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart';
import 'package:paragon_front/default/default_widgets.dart';

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
      home: const SettingsPage(title: 'Ustawienia'),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {},
        ),
        actions: [IconButton(
          icon: const Icon(Icons.close, color: AppColors.primaryColor),
          onPressed: () {},
        ),]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            DefaultTextField(onChanged: (_) {}),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  Text("Ustawienia ogólne", style: TextStyle(color: AppColors.greyText)),
                  ListTile(
                    leading: Icon(Icons.alternate_email),
                    title: Text("Nazwa użytkownika"),
                    trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyAccent),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("E-mail"),
                    trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyAccent),
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text("Zmień hasło"),
                    trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyAccent),
                  ),
                  Text("Inne", style: TextStyle(color: AppColors.greyText)),
                  ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text("Tryb ciemny"),
                    trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyAccent),
                  ),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text("Karta"),
                    trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyAccent),
                  )
                ]
              )
            )
          ]
        )
      ),
    );
  }
}