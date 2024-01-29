import 'package:flutter/material.dart';
import 'friends_list.dart';
import 'history.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  // History data
  final List<Map<String, dynamic>> historyData = [
    {'icon': Icons.dining, 'name': 'Wspólne jedzenie', 'amount': '51.60 PLN'},
    {'icon': Icons.movie, 'name': 'Kino', 'amount': '120.00 PLN'},
    {'icon': Icons.dining, 'name': 'Wspólna kolacja', 'amount': '100.00 PLN'},
    {'icon': Icons.pets_outlined, 'name': 'Zoo', 'amount': '64.30 PLN'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Strona główna',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.person),
            iconSize: 38,
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 40,
              color: const Color(0xFFf85f6a),
              onPressed: () {},
            ),
          ],
        ),

        //Divider
        body: Stack(
          children: [
            Column(
              children: [
                const Divider(
                  color: Colors.grey,
                ),

                //Some text
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing\nelit. Voluptatess quasi iusto officia consequuntur\nquos neque nam magnam ten.Lorem ipsum dolor sit\namet consectetur adipisicing elit. Voluptatess quasi.',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF656565),
                        fontWeight: FontWeight.bold),
                  ),
                ),

                //Big box
                Container(
                  width: 280,
                  height: 160,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFeeecec),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Policzymy twój\nrachunek',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(),
                      const Text(
                        'Wpisz dane i rozluźnij się.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF656565),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 90,
                        height: 24,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFf85f6a),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Policz',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),

                //Two little boxes
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: _buildBox(
                          '42 PLN',
                          Icons.arrow_upward,
                          Colors.black,
                          const Color(0xFFf85f6a),
                          const Color(0xFF06e105)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: _buildBox(
                          '30 PLN',
                          Icons.arrow_downward,
                          Colors.black,
                          const Color(0xFFf85f6a),
                          const Color(0xFFd51616)),
                    ),
                  ],
                ),

                // History
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: historyData.reversed.map((entry) {
                    return _buildHistoryItem(
                        entry['icon'], entry['name'], entry['amount']);
                  }).toList(),
                ),
              ],
            ),

            // Control Panel
            Positioned(
              bottom: 25,
              left: 40,
              right: 40,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFeeecec),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildRoundButton(Icons.people, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FriendsList()));
                    }, false, 35),
                    buildRoundButton(Icons.home, () {
                      
                    }, true, 35),
                    buildRoundButton(Icons.history, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryPage()));
                    }, false, 35),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Two little boxes WIDGET
  Widget _buildBox(String text, IconData icon, Color boxColor,
      Color shadowColor, Color iconColor) {
    return Container(
      width: 120,
      height: 70,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // History item widget
  Widget _buildHistoryItem(IconData icon, String name, String amount) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      width: 300, // Set width to match the parent container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
                fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //Control panel WIDGET
  Widget buildRoundButton(
    IconData icon,
    Function() onPressed,
    bool isSelected,
    double iconSize,
  ) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? const Color(0xFFf85f6a) : Colors.white,
        boxShadow: [
          if (isSelected)
            const BoxShadow(
              color: Color(0xFFf85f6a),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 1),
            ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: iconSize),
        color: isSelected ? Colors.white : Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
