import 'package:finalyearproject/Screens/chatScreens/message_widget.dart';
import 'package:finalyearproject/models/chatMessageModel.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:finalyearproject/services/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './data.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;

  const MessagesWidget({
    @required this.idUser,
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var signedInUsser=Provider.of<StudentProvider>(context,listen: false);
    return StreamBuilder<List<Message>>(
        stream: FirebaseApi.getMessages(idUser),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final messages = snapshot.data;

                return messages.isEmpty
                    ? buildText('Say Hi..')
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];

                          return MessageWidget(
                            message: message,
                            isMe: message.sentBy == signedInUsser.currStudent.studentId,
                          );
                        },
                      );
              }
          }
        },
      );
}

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}