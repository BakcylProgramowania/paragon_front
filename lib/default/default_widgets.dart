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
            icon: const Icon(Icons.add,
                color: AppColors.primaryColor, size: 45),
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


