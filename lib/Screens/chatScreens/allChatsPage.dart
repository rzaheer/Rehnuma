import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/chatScreens/chat_body_widget.dart';
import 'package:finalyearproject/Screens/chatScreens/chat_header_widget.dart';
import 'package:finalyearproject/models/chatMessageModel.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/services/firebase_api.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title:Text("All Chats")),
        backgroundColor: primaryColor,
        body: SafeArea(
          child: StreamBuilder<List<AllMsgModel>>(
            stream: FirebaseApi.getAllMessages(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return buildText('Something Went Wrong Try later');
                  } else {
                    final users = snapshot.data;

                    if (users.isEmpty) {
                      return buildText('No Users Found');
                    } else
                      return Column(
                        children: [
                          //ChatHeaderWidget(mentor: users),
                          ChatBodyWidget(mentorsList: users)
                        ],
                      );
                  }
              }
            },
          ),
        ),
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}