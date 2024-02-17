import 'package:flutter/material.dart';
// ignore: unused_import
import '/default/colors.dart'; // Assuming this contains color definitions.
import '/default/default_widgets.dart'; // Assuming this contains custom widgets like search bar.
import '/library/history_data.dart'; // Assuming this contains the data for the list.

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String searchQuery = '';
  int _selectedIndex = 0; // Assuming this is the index for the History page.

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/friends');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/history');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<HistoryEvent> filteredEvents = HistoryData.historia.where((event) {
      return event.eventName.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Historia',
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: DefaultTextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                final formattedDate =
                    "${event.dataEvent.year}-${event.dataEvent.month.toString().padLeft(2, '0')}-${event.dataEvent.day.toString().padLeft(2, '0')}";

                return DefaultExpansionTile(
                  title: event.eventName,
                  children: <Widget>[
                    ListTile(
                      title: Text('${event.author}'),
                      subtitle: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: '${event.price.toStringAsFixed(2)} zł ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                                text: '| ${event.eventName} | $formattedDate'),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultNavigationBar(
        currentPageIndex: _selectedIndex,
        onPageChanged: _onItemTapped,
      ),
    );
  }
}
