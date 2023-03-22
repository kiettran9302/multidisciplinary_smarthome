import 'package:flutter/material.dart';
import 'package:flutter_smarthome/pages/settings_page.dart';
import '../components/smart_device_box.dart';
import '../components/room_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activeUser = "Nho";
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

  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light 1", Icons.lightbulb, true],
    ["Smart Light 2", Icons.lightbulb, false],
    ["Smart Light 3", Icons.lightbulb, false],
    ["Smart Light 4", Icons.lightbulb, false],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  void _navigateToSettings() => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingPage()))
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_outlined,
          size: 30,
        ),
        actions: [
          GestureDetector(
              onTap: _navigateToSettings,
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.person_outline, size: 30),
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // hello text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Hi $activeUser!",
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Text("Welcome to your smart home"),
                  ],
                ),
              ],
            ),
          ),
          // active rooms
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
            child: SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () => updateIsActive(0),
                    child: RoomBox(
                      roomIcon: Icons.tv,
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
                      roomIcon: Icons.dinner_dining,
                      roomName: "Dining Room",
                      isActive: isActiveList[2],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => updateIsActive(3),
                    child: RoomBox(
                      roomIcon: Icons.car_repair,
                      roomName: "Garage",
                      isActive: isActiveList[3],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
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
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  icon: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ),
          )

          // devices
        ]),
      ),
    );
  }
}
