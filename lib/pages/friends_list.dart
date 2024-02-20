import 'package:flutter/material.dart';
import 'package:paragon_front/pages/history.dart';
import 'package:paragon_front/pages/main_page.dart';
import 'package:paragon_front/default/colors.dart';
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
  final TextEditingController _controller = TextEditingController();

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
  void dispose()
  {
    _controller.dispose();
    super.dispose();
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
                          controller: _controller,
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
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            icon: const Icon(Icons.person_add, size: 35),
                            onPressed: () {
                              showModalBottomSheet(
                                  builder: (context) => SizedBox(
                                        height: 500,
                                        child: Column(children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Text(
                                              'Dodaj znajomego:',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0),
                                            child: DefaultTextField(
                                                controller: _controller,
                                                labelText: 'ID znajomego'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: FilledButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStatePropertyAll<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    )),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll<
                                                                Color>(
                                                            AppColors
                                                                .primaryColor)),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              _controller
                                                                  .text)));
                                                },
                                                child: const Text('Dodaj')),
                                          ),
                                        ]),
                                      ),
                                  context: context);
                            }))
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
              }(),
              DefaultNavigationBar(
                currentPageIndex: 0,
                onPageChanged: (index) {
                  if (index == 0) {
                    return;
                  }
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    if (index == 1) {
                      return MainPage();
                    } else if (index == 2) {
                      return const HistoryPage();
                    } else {
                      return const FriendsList();
                    }
                  }));
                },
              ),
            ],
          );
        } else {
          return const Center(child: Text('Nie masz jeszcze znajomych :('));
        }
      })(),
    );
  }
}
