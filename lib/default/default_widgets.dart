import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart';
import 'package:paragon_front/pages/add_item.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onPlusButtonPressed;
  const DefaultAppBar({
    super.key,
    required this.title,
    this.onPlusButtonPressed,
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
            onPressed: onPlusButtonPressed ??
                () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const AddItemPage(friendsList: ['maciek', 'heniek', 'zbyszek', 'wojtek'], friendsPfp: [
                      'https://avatarfiles.alphacoders.com/331/331455.jpg',
                      'https://i.pinimg.com/736x/88/4e/11/884e119e3f345f003366c341460514cb.jpg',
                      'https://avatars.pfptown.com/031/darth-vader-pfp-3906.png',
                      'https://i.pinimg.com/originals/7d/b9/16/7db9162fb26619d9a18a90542c1ea15a.jpg'
                    ]);
                  }));
                },
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
                  if (imageLink != null)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageLink!),
                      ),
                    ),
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
    {String searchedValue = '', required List<String> searchingList}) {
  List<String> result = [];
  for (var element in searchingList) {
    if (element.toLowerCase().contains(searchedValue.toLowerCase())) {
      result.add(element);
    }
  }

  return result.isNotEmpty ? result : null;
}

class DefaultTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String labelText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  const DefaultTextField(
      {super.key,
      this.onChanged,
      this.labelText = 'Wyszukaj',
      this.suffixIcon = const Icon(Icons.search),
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.defaultTextColor,
      cursorWidth: 1,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: suffixIcon),
      onChanged: onChanged,
    );
  }
}

class DefaultNavigationBar extends StatefulWidget {
  final int currentPageIndex;
  final ValueChanged<int> onPageChanged;

  const DefaultNavigationBar({
    Key? key,
    required this.currentPageIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<DefaultNavigationBar> createState() => _DefaultNavigationBarState();
}

class _DefaultNavigationBarState extends State<DefaultNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final double displayWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .01),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            widget.onPageChanged(index);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == widget.currentPageIndex
                    ? displayWidth * .478
                    : displayWidth * .2,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height:
                      index == widget.currentPageIndex ? displayWidth * .13 : 0,
                  width:
                      index == widget.currentPageIndex ? displayWidth * 1.2 : 0,
                  decoration: BoxDecoration(
                    color: index == widget.currentPageIndex
                        ? Colors.redAccent.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == widget.currentPageIndex
                    ? displayWidth * .40
                    : displayWidth * .2,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == widget.currentPageIndex
                              ? displayWidth * 0.21
                              : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == widget.currentPageIndex ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == widget.currentPageIndex
                                ? listOfStrings[index]
                                : '',
                            style: const TextStyle(
                              color: Color(0xFFFF5252),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == widget.currentPageIndex
                              ? displayWidth * 0.1
                              : 20,
                        ),
                        Icon(
                          listOfIcons[index],
                          size: displayWidth * .076,
                          color: index == widget.currentPageIndex
                              ? Colors.redAccent
                              : const Color(0xFFC3C3C3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.people_alt_rounded,
  Icons.home_rounded,
  Icons.access_time_filled_rounded,
];

List<String> listOfStrings = [
  'Znajomi',
  'Home',
  'Historia',
];
