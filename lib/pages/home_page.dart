import 'package:flutter/material.dart';
import '../components/room_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                const Icon(Icons.person_outline)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 20),
            child: Text(
              "Room selection",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  RoomBox(roomIcon: Icons.abc, roomName: "Living Room"),
                  RoomBox(roomIcon: Icons.bed, roomName: "Bedroom"),
                  RoomBox(roomIcon: Icons.kitchen, roomName: "Kitchen"),
                  RoomBox(roomIcon: Icons.garage, roomName: "Garage")
                ],
              ),
            ),
          )

          // devices
        ]),
      ),
    );
  }
}
