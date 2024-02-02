import 'package:flutter/material.dart';
import 'package:paragon_front/default/colors.dart'; // Assuming this contains color definitions.
import 'package:paragon_front/default/default_widgets.dart'; // Assuming this contains custom widgets like search bar.
import 'package:paragon_front/library/history_data.dart'; // Assuming this contains the data for the list.

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
    // Tutaj implementujesz logikę zmiany strony
    switch (index) {
      case 0:
        // Navigate to the home page
        Navigator.pushReplacementNamed(context, '/friends');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 2:
        // Navigate to the settings page
        Navigator.pushReplacementNamed(context, '/history');
        break;
      // Dodaj więcej przypadków dla innych indeksów, jeśli są potrzebne
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
          
          // Assuming this card shows selected event details

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
