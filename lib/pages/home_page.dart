import 'package:flutter/material.dart';
import '../components/room_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isActiveList = [true, false, false, false];
  void updateIsActive(int index) {
    setState(() {
      if (isActiveList[index] != true) {
        isActiveList[index] = true;
      }
      for (int i = 0; i < isActiveList.length; i++) {
        if (i != index) {
          isActiveList[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Hi Phuc",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const Text("Welcome to your smart home"),
                  ],
                ),
                GestureDetector(
                    onTap: () => print("clicked icon"),
                    child: const Icon(Icons.person_outline))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Room selection",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                GestureDetector(
                  // placeholder
                  child: Icon(Icons.more_horiz),
                  onTap: () => print("Clicked on here"),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () => updateIsActive(0),
                    child: RoomBox(
                      roomIcon: Icons.living,
                      roomName: "Living Room",
                      isActive: isActiveList[0],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => updateIsActive(1),
                    child: RoomBox(
                      roomIcon: Icons.bed,
                      roomName: "Bedroom",
                      isActive: isActiveList[1],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => updateIsActive(2),
                    child: RoomBox(
                      roomIcon: Icons.dining,
                      roomName: "Dining Room",
                      isActive: isActiveList[2],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => updateIsActive(3),
                    child: RoomBox(
                      roomIcon: Icons.garage,
                      roomName: "Garage",
                      isActive: isActiveList[3],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Devices",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                GestureDetector(
                  // placeholder
                  child: Icon(Icons.more_horiz),
                  onTap: () => print("Clicked on here"),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),

          // devices
        ]),
      ),
    );
  }
}
