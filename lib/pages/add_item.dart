import 'package:flutter/material.dart';
// import 'package:multiple_search_selection/multiple_search_selection.dart';
// import 'package:paragon_front/default/colors.dart';
import 'package:paragon_front/default/default_widgets.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key, required this.friends});
  final List<String>? friends;

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final List<List<String>> itemList = [];
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
                  // if (itemList.length == index) {
                  //   return Padding(
                  //     padding:
                  //         const EdgeInsets.only(bottom: 30, left: 8, right: 8),
                  //     child: MultipleSearchSelection<String>(
                  //         title: const Center(
                  //             child: Column(
                  //           children: [
                  //             Text(
                  //               'Znajdź znajomych',
                  //               style: TextStyle(
                  //                   color: AppColors.primaryColor,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 30),
                  //             ),
                  //             Divider(
                  //               color: Colors.black12,
                  //             )
                  //           ],
                  //         )),
                  //         searchField: TextField(
                  //             focusNode: _changingFocus,
                  //             decoration:
                  //                 const InputDecoration(labelText: 'Znajomi')),
                  //         items: widget.friends!,
                  //         pickedItemBuilder: (friend) {
                  //           return Card(
                  //               color: AppColors.primaryColor,
                  //               child: Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Text(
                  //                   friend,
                  //                   style: const TextStyle(fontSize: 23),
                  //                 ),
                  //               ));
                  //         },
                  //         fieldToCheck: (f) => f,
                  //         itemBuilder: (friend, index) {
                  //           return Text(friend);
                  //         }),
                  //   );
                  // }

                  return DismissibleForItems(
                    itemList: itemList[index],
                    itemsList: itemList,
                  );
                }),
          ),
        ]));
  }
}

class DismissibleForItems extends StatefulWidget {
  DismissibleForItems({required this.itemList, required this.itemsList})
      : super(key: ValueKey<List<String>>(itemList));

  final List<String> itemList;
  final List<List<String>> itemsList;

  @override
  State<DismissibleForItems> createState() => _DismissibleForItemsState();
}

class _DismissibleForItemsState extends State<DismissibleForItems> {
  bool _edited = false;
  late TextEditingController _itemNameController;
  late TextEditingController _itemPriceController;

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
    super.dispose();
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
              )
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
