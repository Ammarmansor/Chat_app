
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    
    super.key, required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
          decoration: const BoxDecoration(
          color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child:  Text(message),
        ),
      ),
    );
  }
}
