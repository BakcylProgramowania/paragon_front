import 'package:flutter/material.dart';
import '../library/history_data.dart';

void main() {
  runApp(const HistoryPage());
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromARGB(255, 201, 201, 201),
                height: 2.0,
                width: 250,
              ),
              Container(
                color: Colors.redAccent,
                height: 2.0,
                width: 150,
              ),
            ],
          ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
        leadingWidth: 90,
        leading: Container(
          margin: const EdgeInsets.only(left: 30),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              size: 50,
            ),
          ),
        ),
        title: const Text(
          "Historia",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_sharp,
                size: 50,
                color: Colors.redAccent,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 45,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 197, 197, 197),
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 180, 180, 180),
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "Wyszukaj",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                width: 110,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 197, 197, 197),
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: InkWell(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Filtr",
                        style: TextStyle(
                          color: Color.fromARGB(255, 180, 180, 180),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.align_vertical_top_sharp)
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            height: 10,
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: HistoryData.historia.length,
              itemBuilder: (context, index) {
                final event = HistoryData.historia[index];
                return Column(
                  children: [
                    ListTile(
                      title: Container(
                        width: 400,
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 213, 213, 213),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  event.eventName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: event.price.toStringAsFixed(2),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: " PLN     ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 186, 186, 186),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Transform(
                                  transform: Matrix4.rotationZ(1.55)
                                    ..translate(0, -20),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      indent: 50,
                      endIndent: 50,
                      height: 10,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
