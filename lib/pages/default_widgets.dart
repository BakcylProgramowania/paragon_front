import 'package:flutter/material.dart';
import 'package:paragon_front/colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const DefaultAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        child: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 45,
          onPressed: () {},
        ),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon:
                const Icon(Icons.add, color: AppColors.primaryColor, size: 45),
            onPressed: () {},
          ),
        ),
      ],
      centerTitle: true,
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(width: 350, child: Divider(color: Colors.black12))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class DefaultTextFormField extends StatelessWidget {
  final String title;
  final bool coma;
  const DefaultTextFormField({
    super.key,
    required TextEditingController signinController,
    required this.title,
    required this.coma,
  }) : _signinController = signinController;

  final TextEditingController _signinController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _signinController,
      decoration: InputDecoration(
          labelText: title,
          labelStyle:
              const TextStyle(color: AppColors.grayAccent, fontSize: 15),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppColors.grayAccent,
            ),
          ),
          contentPadding: const EdgeInsets.all(15)),
      obscureText: coma,
    );
  }
}

class DefaultLogo extends StatelessWidget {
  const DefaultLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
            fontSize: 80, fontWeight: FontWeight.w800, color: Colors.black),
        children: [
          TextSpan(
              text: 'Para', style: TextStyle(color: AppColors.primaryColor)),
          TextSpan(
              text: 'gon', style: TextStyle(color: AppColors.defaultTextColor)),
        ],
      ),
    );
  }
}
