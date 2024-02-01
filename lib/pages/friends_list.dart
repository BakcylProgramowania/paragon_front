import 'package:flutter/material.dart';
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
                          child: DefaultTextField(
                            onChanged: (searchedValue) {
                              setState(() {
                                _searchedFriendsList = search(
                                    searchingList: widget.friendsList!,
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
                            return DefaultExpansionTile(
                              title: _searchedFriendsList![index],
                              imageLink: widget.linksToFriendsPfps?[
                                  _searchedFriendsList?[index]],
                              children: widget.friendsHistory?[
                                          _searchedFriendsList![index]]
                                      ?.map((e) => Center(child: Text(e)))
                                      .toList() ??
                                  [
                                    const Center(
                                        child: Text(
                                            'Nie dokonałeś jeszcze wspólnych rozliczeń'))
                                  ],
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


