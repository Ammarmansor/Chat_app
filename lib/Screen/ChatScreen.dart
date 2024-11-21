import 'package:chat_app2/widgets/ChatBubble.dart';
import 'package:chat_app2/widgets/CustomTextField.dart';
import 'package:chat_app2/widgets/chatStream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  CollectionReference messages =
  FirebaseFirestore.instance.collection('messages');
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                  height: 50,
                  width: 50,
                  image: AssetImage('assets/Schoollogo.jpg')),
            ),
            Text(' Chat'),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ChatStream()),
          CustomTextField(
            controller: _controller,
            onSubmitted: (data) {
              messages.add({
                'message': data,
                'time': FieldValue.serverTimestamp(),
              });
              _controller.clear();
            },
            label: 'Chat',
            hintText: 'Type your message here',
            iconData: IconButton(
                onPressed: () {
                  if (_controller.text.trim().isNotEmpty) {
                    final data = _controller.text.trim();
                    messages.add({
                      'message': data,
                      'timestamp': FieldValue.serverTimestamp(),
                    });
                    _controller.clear();
                  }
                },
                icon: const Icon(Icons.send)),
          ),
        ],
      ),
    );
  }
}
