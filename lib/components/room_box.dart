import 'package:flutter/material.dart';

class RoomBox extends StatelessWidget {
  final IconData roomIcon;
  final String roomName;
  const RoomBox({Key? key, required this.roomIcon, required this.roomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 100,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(20)),
            height: 100.0,
            width: 100,
            child: Icon(
              roomIcon,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              roomName,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
