import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_admin_application/screens/chat_screen/chat_screenn.dart';
import 'package:tripx_admin_application/utils/animation.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';

class ChatLitsshow extends StatefulWidget {
  const ChatLitsshow({super.key});

  @override
  State<ChatLitsshow> createState() => _ChatLitsshowState();
}

class _ChatLitsshowState extends State<ChatLitsshow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        leading: Icon(
          Icons.chat,
          color: whitecolor,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: colorteal,
        title: Text(
          'CHATS',
          style: TextStyle(
              color: whitecolor,
              fontWeight: FontWeight.bold,
              fontFamily: bodoni),
        ),
      ),
      body: buildChatRoomList(),
    );
  }

  Widget buildChatRoomList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chatroom').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorteal, size: 60));
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final List<DocumentSnapshot> chatRooms = snapshot.data!.docs;

        return ListView.builder(
          itemCount: chatRooms.length,
          itemBuilder: (context, index) {
            final chatRoom = chatRooms[index];
            return StreamBuilder<QuerySnapshot>(
              stream: chatRoom.reference
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .limit(1)
                  .snapshots(),
              builder: (context, messageSnapshot) {
                if (messageSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                          color: colorteal, size: 60));
                }

                if (messageSnapshot.hasError) {
                  return Center(child: Text('Error: ${messageSnapshot.error}'));
                }

                if (!messageSnapshot.hasData ||
                    messageSnapshot.data!.docs.isEmpty) {
                  return ListTile(
                    title: Text('No messages'),
                  );
                }

                final messageDoc = messageSnapshot.data!.docs.first;
                final data = messageDoc.data()! as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    color: colorteal,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: whitecolor,
                        child: Icon(Icons.person, color: colorteal),
                      ),
                      title: Text(
                        data['senderemail'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whitecolor),
                      ),
                      subtitle: Text(
                        data['message'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: black54),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('hh:mm a').format(
                              (data['timestamp'] as Timestamp).toDate(),
                            ),
                            style: TextStyle(color: black54),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(FadeTransitionPageRoute(
                          child: ChatScreenn(
                            chatroomId: chatRoom.id,
                            senderemail: data['senderemail'],
                            senderid: data['senderid'],
                          ),
                        ));
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
