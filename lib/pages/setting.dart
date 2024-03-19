import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart';

class SettingPage extends StatefulWidget {
  final String title;
  final Widget child;
  const SettingPage({super.key, required this.title, required this.child});
  
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {Navigator.pop(context);},
          color: AppColors.primaryColor
        ),
        actions: [IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
          color: AppColors.primaryColor
        )]
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: widget.child,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700
                  ),
                  padding: const EdgeInsets.all(13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Zapisz zmiany",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                  ),
                )
              ),
              const SizedBox(height: 10)
            ],
          )
        ),
      )
    );
  }
}