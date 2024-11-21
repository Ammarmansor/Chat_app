import 'package:chat_app2/model/messageModel.dart';
import 'package:chat_app2/widgets/ChatBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatStream extends StatelessWidget {
  ChatStream({super.key});
  final Stream<QuerySnapshot> messagesStream =
      FirebaseFirestore.instance.collection('messages').orderBy('time', descending: true).snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: messagesStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<MessageModel> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(MessageModel.fromjson(snapshot.data.docs[i]));
          }
          
          return ListView.builder(
            reverse: true,
              itemCount: messagelist.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: messagelist[index].message,
                );
              });
        }
      },
    );
  }
}
