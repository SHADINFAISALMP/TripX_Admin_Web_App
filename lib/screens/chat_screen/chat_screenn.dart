

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:tripx_admin_application/utils/colors.dart';

class ChatScreenn extends StatefulWidget {
  final String chatroomId;
  final String senderemail;
  final String senderid;

  const ChatScreenn({
    super.key,
    required this.chatroomId,
    required this.senderemail,
    required this.senderid,
  });

  @override
  State<ChatScreenn> createState() => _ChatScreennState();
}

class _ChatScreennState extends State<ChatScreenn> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ChatService _chatService = ChatService();

  final TextEditingController _controller = TextEditingController();
  void _sendMessage() async {
    print("Sending message...");
    if (_controller.text.isNotEmpty) {
      try {
        await _chatService.sendMessage(
            widget.chatroomId, 'admin', _controller.text, widget.senderemail);
        _controller.clear();
        print("Message sent successfully.");
      } catch (e) {
        print("Failed to send message: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: whitecolor,
            )),
        backgroundColor: colorteal,
        toolbarHeight: 80,
        titleSpacing: 20,
        automaticallyImplyLeading: false,
        title: Text(
          widget.senderemail,
          style: TextStyle(color: whitecolor, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == 'clear') {
                // Add logic to clear messages if needed
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'clear',
                  child: Text('Clear Messages'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessagelist(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessagelist() {
    return StreamBuilder(
      stream: _chatService.getMessages(widget.chatroomId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading....");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.message,
                    color: colorteal,
                    size: 30,
                  ),
                  hintText: 'Type a message.....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: colorteal,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: colorteal,
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    color: colorteal,
                    iconSize: 35,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                      print('Chatroom ID: ${widget.chatroomId}');
                      print('Sender ID: ${widget.senderid}');
                      print('Sender Email: ${widget.senderemail}');
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  String? adminId;
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final String currentUserId = 'admin';
    bool isSentByMe = data['senderid'] == currentUserId;

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ChatBubble(
        message: data['message'],
        timestamp: data['timestamp'],
        isSentByMe: isSentByMe,
      ),
    );
  }
}

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String chatRoomId, String senderId, String message,
      String senderEmail) async {
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderId: senderId,
        senderemail: senderEmail,
        message: message,
        timestamp: timestamp);

    // String chatRoomId = senderId;

    await _firestore
        .collection("chatroom")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String chatRoomId) {
    return _firestore
        .collection("chatroom")
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getUserChats(String adminId) {
    return _firestore
        .collection('chatroom')
        .where('participants', arrayContains: adminId)
        .snapshots();
  }
}

class Message {
  final String senderId;
  final String senderemail;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderemail,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderid': senderId,
      'senderemail': senderemail,
      'message': message,
      'timestamp': timestamp,
    };
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final Timestamp timestamp;
  final bool isSentByMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm a').format(timestamp.toDate());

    return Container(
      margin: isSentByMe
          ? EdgeInsets.only(left: 50, top: 10, bottom: 10, right: 10)
          : EdgeInsets.only(right: 50, top: 10, bottom: 10, left: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: isSentByMe
            ? LinearGradient(
                colors: [Colors.teal.shade300, Colors.teal.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  Colors.teal.shade700,
                  Colors.teal.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: isSentByMe
            ? BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: isSentByMe ? Colors.white : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            formattedTime,
            style: TextStyle(
              fontSize: 12,
              color: isSentByMe ? Colors.white70 : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
