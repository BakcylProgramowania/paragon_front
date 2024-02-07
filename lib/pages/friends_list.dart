import 'package:flutter/material.dart';
import '/default/colors.dart';
import '/default/default_widgets.dart';

class FriendsList extends StatefulWidget {
  final List<String>? friendsList;
  final Map<String, String>? linksToFriendsPfps;
  final Map<String, List<String>>? friendsHistory;
  //we should probably add list with all user names and a map with links to their pfps {user1: linkToPictureForUser1}

  const FriendsList(
      {super.key,
      this.friendsList,
      this.linksToFriendsPfps,
      this.friendsHistory});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  List<String>? _searchedFriendsList;

  @override
  void initState() {
    super.initState();
    if (widget.friendsList != null) {
      _searchedFriendsList = [];
      for (var element in widget.friendsList!) {
        _searchedFriendsList!.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: 'Znajomi'),
        body: (() {
          if (widget.friendsList != null) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: TextField(
                            cursorColor: AppColors.defaultTextColor,
                            cursorWidth: 1,
                            decoration: InputDecoration(
                                labelText: 'Wyszukaj',
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                labelStyle: const TextStyle(
                                    color: AppColors.primaryColor),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon: const Icon(Icons.search)),
                            onChanged: (searchedValue) {
                              setState(() {
                                _searchedFriendsList = _search(
                                    friendsList: widget.friendsList!,
                                    searchedValue: searchedValue);
                              });
                            },
                          ),
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.qr_code,
                            size: 35,
                          )),
                      const Expanded(
                          flex: 1, child: Icon(Icons.person_add, size: 35))
                    ],
                  ),
                ),
                const SizedBox(
                    width: 330,
                    child: Divider(height: 10, color: Colors.black12)),
                () {
                  if (_searchedFriendsList != null) {
                    return Expanded(
                      child: ListView.builder(
                          //shrinkWrap: true,
                          itemCount: _searchedFriendsList!.length,
                          itemBuilder: (context, index) {
                            return FriendsListItem(
                              friend: _searchedFriendsList![index],
                              friendPfp: widget.linksToFriendsPfps![
                                  _searchedFriendsList![index]]!,
                              friendHistory: widget.friendsHistory?[
                                  _searchedFriendsList![index]],
                            );
                          }),
                    );
                  } else {
                    return const Center(
                        child: Text('Nie można znaleźć szukanych znajomych'));
                  }
                }()
              ],
            );
          } else {
            return const Center(child: Text('Nie masz jeszcze znajomych :('));
          }
        })());
  }
}

class FriendsListItem extends StatelessWidget {
  final String friend;
  final String friendPfp;
  final List<String>? friendHistory;
  const FriendsListItem(
      {required this.friend,
      required this.friendPfp,
      this.friendHistory,
      super.key});

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
                  const Icon(
                    Icons.supervisor_account,
                    color: Colors.black,
                  ),
                  Text(
                    friend,
                  )
                ]),
                iconColor: AppColors.primaryColor,
                collapsedIconColor: AppColors.primaryColor,
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: friendHistory
                            ?.map((e) => Center(child: Text(e)))
                            .toList() ??
                        [
                          const Center(
                              child: Text(
                                  'Nie dokonałeś jeszcze wspólnych rozliczeń'))
                        ],
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

List<String>? _search(
    {String searchedValue = '', required List<String> friendsList}) {
  List<String> result = [];
  for (var element in friendsList) {
    if (element.toLowerCase().contains(searchedValue.toLowerCase())) {
      result.add(element);
    }
  }

  return result.isNotEmpty ? result : null;
}
