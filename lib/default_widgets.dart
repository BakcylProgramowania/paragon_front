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

class DefaultExpansionTile extends StatelessWidget {
  final String title;
  final String? imageLink;
  final List<Widget> children;
  const DefaultExpansionTile(
      {super.key, required this.title, required this.children, this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ExpansionTile(
                title: Row(children: [
                  if (imageLink != null) ...[
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageLink!),
                      ),
                    ),
                  ],
                  Text(
                    title,
                  )
                ]),
                iconColor: AppColors.primaryColor,
                collapsedIconColor: AppColors.primaryColor,
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: children,
                  )
                ]),
          ),
        ),
        const SizedBox(
            width: 330,
            child: Divider(
              height: 10,
              color: Colors.black12,
            ))
      ],
    );
  }
}

List<String>? search(
    {String searchedValue = '', required List<String> friendsList}) {
  List<String> result = [];
  for (var element in friendsList) {
    if (element.toLowerCase().contains(searchedValue.toLowerCase())) {
      result.add(element);
    }
  }

  return result.isNotEmpty ? result : null;
}
