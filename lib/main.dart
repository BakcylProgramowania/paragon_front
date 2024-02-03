import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bilans = 30.52;

  // History data
  final List<Map<String, dynamic>> historyData = [
    {'icon': Icons.dining, 'name': 'Wspólne jedzenie', 'amount': '51.60 PLN'},
    {'icon': Icons.movie, 'name': 'Kino', 'amount': '120.00 PLN'},
    {'icon': Icons.dining, 'name': 'Wspólna kolacja', 'amount': '100.00 PLN'},
    {'icon': Icons.pets_outlined, 'name': 'Zoo', 'amount': '64.30 PLN'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          children: [
            const Divider(
              color: Colors.grey,
            ),
            //Some text
            Container(
              padding: const EdgeInsets.all(12),
              child: const Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing\nelit. Voluptatess quasi iusto officia consequuntur\nquos neque nam magnam ten.Lorem ipsum dolor sit\namet consectetur adipisicing elit. Voluptatess quasi.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF656565),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Big box
            Container(
              width: 320,
              height: 160,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFeeecec),
                borderRadius: BorderRadius.circular(20),
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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(),
                  const Text(
                    'Wpisz dane i rozluźnij się.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF656565),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    height: 28,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFf85f6a),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Policz',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Bilans
            const SizedBox(height: 30),
            _buildBox('Do\n oddania $bilans PLN', Colors.black, const Color(0xFFf85f6a)),
            // History
            const SizedBox(
              height: 25,
            ),
            Column(
              children: historyData.reversed.map((entry) {
                return _buildHistoryItem(entry['icon'], entry['name'], entry['amount']);
              }).toList(),
            ),
          ],
        ),
      ),
      // Control Panel
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFeeecec),
          borderRadius: BorderRadius.circular(0),
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
            _buildRoundButton(Icons.people, iconSize: 35),
            _buildRoundButton(Icons.home, isSelected: true, iconSize: 35),
            _buildRoundButton(Icons.history, iconSize: 35),
          ],
        ),
      ),
    );
  }

  //Bilans WIDGET
  Widget _buildBox(String text, Color boxColor, Color shadowColor) {
    return Container(
      width: 320,
      height: 100,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          // "Do oddania" text
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Align vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Align horizontally
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Do',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '\noddania',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Amount and PLN
          Row(
            children: [
              // Dynamic amount
              Text(
                '$bilans',
                style: const TextStyle(
                  color: Color(0xFFf85f6a),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4), // Spacing between amount and PLN
              // PLN text
              const Text(
                'PLN',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
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
      width: 320, // Set width to match the parent container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //Control panel WIDGET
  Widget _buildRoundButton(IconData icon, {bool isSelected = false, double iconSize = 30}) {
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
        onPressed: () {},
      ),
    );
  }
}
