// ignore_for_file: avoid_print, unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart';
import 'package:paragon_front/default/default_widgets.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import '../main.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key, this.friendsPfp, this.friendsList});
  final List<String>? friendsPfp;
  final List<String>? friendsList;

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

Future<void> sendReceipt(List<List<String>> addedItemList) async {
  // Pobranie authtokena
  final String? authToken = await getAuthTokenLocally();

  // Sprawdzenie czy authtoken został pobrany poprawnie
  if (authToken != null) {
    final url = Uri.https("paragon.wroc.ovh", "/receipt");

    try {
      // Mapowanie przedmiotów na odpowiedni format
      final List<Map<String, dynamic>> items = addedItemList.map((item) {
        try {
          final int price = int.parse(item[1]);
          return {
            "whoBuy": "65786066b8bbf529cbc56fc1",
            "item": item[0],
            "price": price,
            "amount": 1,
          };
        } catch (e) {
          print("Błąd podczas parsowania ceny: $e");
          print("Dane, które powodują problem: $item");
          throw Exception("Błąd podczas parsowania ceny");
        }
      }).toList();

      // Wysłanie żądania HTTP POST
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': authToken,
        },
        body: jsonEncode({
          "reciptName": "Zakupy w Lidlu",
          "data": {"items": items}
        }),
      );
      print("Request body: ${jsonEncode({"reciptName": "Zakupy w Lidlu", "data": {"items": items}})}");

      // Wyświetlenie odpowiedzi
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    } catch (error) {
      print("Błąd: $error");
    }
  } else {
    // Jeśli nie udało się pobrać authtokena
    print("Nie działa wysyłanie, bo nie ma authtokena");
  }
}

class _AddItemPageState extends State<AddItemPage> {
  final List<List<String>> itemList = [];
  List<List<String>> addedItemsList = [];
  final _itemNameController = TextEditingController();
  final _itemPriceController = TextEditingController();
  final _changingFocus = FocusNode();
  // final MultipleSearchController _friendsSelectionFieldController =
  //     MultipleSearchController();

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    _changingFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(
          title: 'Dadaj paragon',
          onPlusButtonPressed: null,
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddItemForm(
                setStateInYourContext: (_) {
                  setState(() {
                    itemList.add([
                      _itemNameController.text,
                      _itemPriceController.text,
                    ]);
                  });
                },
                itemNameController: _itemNameController,
                itemPriceController: _itemPriceController,
              )),
          Expanded(
            child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (ctx, index) {
                  return DismissibleForItems(
                    setGlobalState: setState,
                    friendsList: widget.friendsList,
                    itemList: itemList[index],
                    itemsList: itemList,
                    friendsPfpList: widget.friendsPfp,
                  );
                }),
          ),
          FilledButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )),
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      AppColors.primaryColor)),
              onPressed: () {
                setState(() {
                  addedItemsList.addAll(itemList);
                  print("Dodane przedmioty: $addedItemsList");
                  sendReceipt(addedItemsList);
                });

                //postData();
              },
              child: const Text('Dodaj')),
        ]));
  }
}

class DismissibleForItems extends StatefulWidget {
  DismissibleForItems(
      {required this.itemList,
      required this.itemsList,
      this.friendsPfpList,
      this.friendsList,
      required this.setGlobalState})
      : super(key: ValueKey<List<String>>(itemList));

  final List<String> itemList;
  final List<String>? friendsPfpList;
  final List<String>? friendsList;
  final List<List<String>> itemsList;
  final void Function(void Function()) setGlobalState;

  @override
  State<DismissibleForItems> createState() => _DismissibleForItemsState();
}

class _DismissibleForItemsState extends State<DismissibleForItems> {
  bool _edited = false;
  late TextEditingController _itemNameController;
  late TextEditingController _itemPriceController;
  final TextEditingController _modalSheetController = TextEditingController();
  bool checkboxStatus = false;

  @override
  void initState() {
    super.initState();
    _itemNameController = TextEditingController(text: widget.itemList[0]);
    _itemPriceController = TextEditingController(text: widget.itemList[1]);
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    _modalSheetController.dispose();
    super.dispose();
  }

  void addFriendsToItem() {
    List<String>? searchedFriends = [...widget.friendsList!];
    List<String> chosenFriends = [];

    for (int i = 2; i < widget.itemList.length; i++) {
      chosenFriends.add(widget.itemList[i]);
    }

    for (var friend in chosenFriends) {
      searchedFriends.remove(friend);
    }
    showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setSheetState) => Column(children: <Widget>[
                if (chosenFriends.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                          itemCount: chosenFriends.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () => setSheetState(() {
                                if (searchedFriends != null) {
                                  searchedFriends!.add(chosenFriends[index]);
                                  searchedFriends!.sort();
                                }
                                widget.itemList.removeWhere((element) =>
                                    element == chosenFriends[index]);
                                chosenFriends.removeAt(index);
                                checkboxCheckedForFriendsAutofill();
                              }),
                              child: Card(
                                  color: AppColors.primaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            widget.friendsPfpList![
                                                widget.friendsList!.indexOf(
                                                    chosenFriends[index])]),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(chosenFriends[index],
                                          style: const TextStyle(fontSize: 18)),
                                    ]),
                                  )),
                            );
                          }),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text('Wybierz znajomych',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultTextField(
                          controller: _modalSheetController,
                          onChanged: (searched) {
                            setSheetState(() {
                              searchedFriends = search(
                                  searchingList: widget.friendsList!,
                                  searchedValue: searched);
                              if (searchedFriends != null) {
                                for (int i = 0;
                                    i < searchedFriends!.length;
                                    i++) {
                                  if (chosenFriends
                                      .contains(searchedFriends![i])) {
                                    searchedFriends!.removeAt(i);
                                  }
                                }
                              }
                              //setState(() {});
                            });
                          },
                        ),
                      ),
                    ),
                    Checkbox(
                        value: checkboxStatus,
                        activeColor: AppColors.primaryColor,
                        onChanged: (status) {
                          setSheetState((() => checkboxStatus = status!));
                          checkboxCheckedForFriendsAutofill();
                        })
                  ],
                ),
                Expanded(
                  child: searchedFriends != null
                      ? ListView.builder(
                          itemCount: searchedFriends!.length,
                          itemBuilder: (ctx, index) {
                            // return _ChoosableFriendFromList(
                            //     searchedFriends: searchedFriends,
                            //     setState: () => setState((){}),
                            //     chosenFriends: chosenFriends,
                            //     widget: widget,
                            //     searchedFriend: searchedFriends![index]);
                            return GestureDetector(
                              onTap: () => setSheetState(() {
                                if (searchedFriends != null) {
                                  chosenFriends.add(searchedFriends![index]);
                                  widget.itemList.add(searchedFriends![index]);
                                  searchedFriends!.removeAt(searchedFriends!
                                      .indexOf(searchedFriends![index]));
                                }
                                checkboxCheckedForFriendsAutofill();
                              }),
                              child: AbsorbPointer(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(widget
                                                    .friendsPfpList![
                                                widget.friendsList!.indexOf(
                                                    searchedFriends![index])]),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Text(searchedFriends![index],
                                              style: const TextStyle(
                                                  fontSize: 14)),
                                        ],
                                      ),
                                      const Divider(color: Colors.black12)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                  'Nie można znaleźć szukanych znajomych :(',
                                  style: TextStyle(fontSize: 20))),
                        ),
                )
              ]),
            ));
  }

  void checkboxCheckedForFriendsAutofill() {
    if (checkboxStatus) {
      var start = widget.itemsList.indexOf(widget.itemList) + 1;

      for (int i = start; i < widget.itemsList.length; i++) {
        widget.itemsList[i].removeWhere((element) {
          if (widget.itemsList[i].indexOf(element) > 1 &&
              widget.itemList.indexOf(element) > 1) {
            return true;
          }
          return false;
        });

        for (int j = 2; j < widget.itemList.length; j++) {
          widget.itemsList[i].add(widget.itemList[j]);
        }
      }
    }
    widget.setGlobalState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.key!,
      background: Container(color: Colors.green, child: const Icon(Icons.edit)),
      secondaryBackground:
          Container(color: Colors.red, child: const Icon(Icons.delete)),
      direction: _edited ? DismissDirection.none : DismissDirection.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              if (!_edited)
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      '${widget.itemList[0]}:',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 70),
                    Expanded(
                        child: Center(
                            child: Text('${widget.itemList[1]} PLN',
                                style: const TextStyle(fontSize: 20)))),
                    if (widget.friendsPfpList != null &&
                        widget.friendsPfpList!.isNotEmpty)
                      Expanded(
                        child: GestureDetector(
                          onTap: addFriendsToItem,
                          child: Row(
                            children: [
                              if (widget.itemList.length > 2) ...[
                                Stack(
                                  children: <Widget>[
                                    if (widget.itemList.length < 7)
                                      for (var i = 2;
                                          i < widget.itemList.length;
                                          i++)
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20 * (i - 2).toDouble()),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                widget.friendsPfpList![
                                                    widget.friendsList!.indexOf(
                                                        widget.itemList[i])]),
                                          ),
                                        )
                                    else
                                      for (int i = 2; i < 7; i++)
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20 * i.toDouble()),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                widget.friendsPfpList![
                                                    widget.friendsList!.indexOf(
                                                        widget.itemList[i])]),
                                          ),
                                        ),
                                  ],
                                ),
                                if (widget.itemList.length > 6)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 3.0),
                                    child: Text(
                                      '...',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                              ] else ...[
                                const SizedBox(width: 50),
                                const Icon(
                                  Icons.add_reaction,
                                  size: 30,
                                  color: AppColors.primaryColor,
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                  ],
                )
              else
                AddItemForm(
                  setStateInYourContext: (_) {
                    setState(() {
                      _edited = false;
                      widget.itemList[0] = _itemNameController.text;
                      widget.itemList[1] = _itemPriceController.text;
                    });
                  },
                  itemNameController: _itemNameController,
                  itemPriceController: _itemPriceController,
                ),
              const Divider(
                color: Colors.black12,
              ),
            ],
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          setState(() {
            _edited = true;
          });
          return false;
        }
        return true;
      },
      onDismissed: (direction) =>
          widget.itemsList.removeAt(widget.itemsList.indexOf(widget.itemList)),
    );
  }
}

class AddItemForm extends StatefulWidget {
  const AddItemForm(
      {super.key,
      required this.setStateInYourContext,
      required this.itemNameController,
      required this.itemPriceController});
  final void Function(void Function()) setStateInYourContext;
  final TextEditingController itemNameController;
  final TextEditingController itemPriceController;

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _changingFocus = FocusNode();

  @override
  void dispose() {
    _changingFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: TextField(
              decoration: const InputDecoration(labelText: 'Dodaj zamówienie'),
              controller: widget.itemNameController,
              onSubmitted: (value) {
                if (widget.itemNameController.text.isNotEmpty &&
                    widget.itemPriceController.text.isNotEmpty) {
                  widget.setStateInYourContext(() {});

                  widget.itemNameController.clear();
                  widget.itemPriceController.clear();
                } else {
                  _changingFocus.requestFocus();
                }
              },
            )),
        const SizedBox(width: 20),
        Expanded(
            flex: 1,
            child: TextField(
              focusNode: _changingFocus,
              onSubmitted: (value) {
                if (widget.itemNameController.text.isNotEmpty &&
                    widget.itemPriceController.text.isNotEmpty) {
                  widget.setStateInYourContext(() {});
                  widget.itemNameController.clear();
                  widget.itemPriceController.clear();
                }
              },
              decoration: const InputDecoration(labelText: 'Kwota (PLN)'),
              keyboardType: TextInputType.number,
              controller: widget.itemPriceController,
            )),
      ],
    );
  }
}
