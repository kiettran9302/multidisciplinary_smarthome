import 'package:flutter/material.dart';

class RoomBox extends StatefulWidget {
  final IconData roomIcon;
  final String roomName;
  bool isActive;

  RoomBox(
      {Key? key,
      required this.roomIcon,
      required this.roomName,
      required this.isActive})
      : super(key: key);

  @override
  _RoomBoxState createState() => _RoomBoxState();
}

class _RoomBoxState extends State<RoomBox> {
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
              borderRadius: BorderRadius.circular(20),
              color: widget.isActive ? Colors.black : Colors.white,
            ),
            height: 100.0,
            width: 100,
            child: Icon(
              widget.roomIcon,
              color: widget.isActive ? Colors.white : Colors.black,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.roomName,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
