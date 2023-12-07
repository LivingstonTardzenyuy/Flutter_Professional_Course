import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/chat_section.dart';
import '../constant.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String messageText;

  @override
  void initState() {
    super.initState();
    // Call the asynchronous function in initState
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final user = await firebaseAuth.currentUser!;
      if (user != null) {
        final userEmail = user.email;
        print("Email is $userEmail");
        // Save the email to the provider
        Provider.of<ChatSection>(context, listen: false).getCurrentUserEmail;
      } else {
        print("NO user is logged in");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              //Implement logout functionality
              // FirebaseAuth.instance.signOut();
              // Navigator.pop(context);

              Provider.of<ChatSection>(context, listen: false).getChatStream();
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Consumer<ChatSection>(
            builder: (BuildContext context, ChatSection addChat, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                      stream: addChat.getChatStream(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          final messages = snapshot.data!.docs;      //accessing the data inside our async snapshot.
                          List<Text> messageWidgets = [];
                          for (var message in messages){
                            final messageText = message['text'];
                            final senderText = message['sender'];

                            final messageWidget = Text('$messageText from $senderText', style: TextStyle(color: Colors.black),);
                            messageWidgets.add(messageWidget);

                          }
                          return Column(
                            children: messageWidgets,
                          );
                        } else if(snapshot.hasError){
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                  Container(
                    decoration: kMessageContainerDecoration,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                              messageText = value;
                            },
                            decoration: kMessageTextFieldDecoration,
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            try {
                              String? sender = await addChat.getCurrentUserEmail();
                              if (sender != null) {
                                await addChat.AddChat(
                                  sender: sender,
                                  text: messageText,
                                );
                              } else {
                                // Handle the case when sender is null
                                print("Sender is null");
                              }
                            } catch (e) {
                              // Handle the exception if needed
                              print("Failed to add chat: $e");
                            }
                          },
                          child: Text(
                            'Send',
                            style: kSendButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
