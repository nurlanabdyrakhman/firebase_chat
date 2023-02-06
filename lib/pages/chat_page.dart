import 'package:firebase_chat/pages/group-info.dart';
import 'package:firebase_chat/service/database_service.dart';
import 'package:firebase_chat/shared/contants.dart';
import 'package:firebase_chat/widgets/message_tile.dart';
import 'package:firebase_chat/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.groupId,
    required this.groupName,
    required this.userName,
  });
  final String groupId;
  final String groupName;
  final String userName;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messageController = TextEditingController();
  String admin = '';

  @override
  void initState() {
    getChatadnAdmin();
    super.initState();
  }

  getChatadnAdmin() {
    DatabaseService().getChats(widget.groupId).then((val) {
      setState(() {
        chats = val;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((val) {
      setState(() {
        admin = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                  context,
                  GroupInfo(
                    groupId: widget.groupId,
                    groupName: widget.groupName,
                    adminName: admin,
                  ),
                );
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Stack(
        children: <Widget>[
          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF0f503c),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Send a Message...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage(
                        
                      );
                    },
                    child: Container(
                     
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: ((context, index) {
                  return MessageTile(
                    message: snapshot.data.docs[index]['message'],
                    sender: snapshot.data.docs[index]['sender'],
                    sentByMe:
                        widget.userName == snapshot.data.docs[index]['sender'],
                  );
                }),
              )
            : Container();
      },
    );
  }

    sendMessage() {
      if(messageController.text.isNotEmpty){
        Map<String,dynamic>chatMessageMap={
          'message':messageController.text,
          'sender':widget.userName,
          'time':DateTime.now().millisecondsSinceEpoch
        };
        DatabaseService().sendMessage(
           widget. groupId,
           chatMessageMap
           );
           setState(() {
             messageController.clear();
           });
      }
    }
}
