import 'package:finalyearproject/Screens/chatScreens/messages_widget.dart';
import 'package:finalyearproject/Screens/chatScreens/new_message_widget.dart';
import 'package:finalyearproject/Screens/chatScreens/profile_header_widget.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final MentorModel mentor;

  const ChatPage({
    @required this.mentor,
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var usser=Provider.of<StudentProvider>(context,listen: false);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(name: widget.mentor.fullName),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(idUser: "${usser.currStudent.studentId}-${widget.mentor.mentorId}"),
                ),
              ),
              NewMessageWidget(mentor: widget.mentor,loggedInStudent: usser.currStudent)
            ],
          ),
        ),
      );
}
}