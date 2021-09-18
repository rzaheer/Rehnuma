
import 'package:finalyearproject/Screens/chatScreens/chat_page.dart';
import 'package:finalyearproject/models/chatMessageModel.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:flutter/material.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<AllMsgModel> mentorsList;

  const ChatBodyWidget({
    @required this.mentorsList,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final mentor = mentorsList[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(mentor: MentorModel(fullName: mentor.mentorName,mentorId: mentor.mentorId)),
                ));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/President_Barack_Obama.jpg/480px-President_Barack_Obama.jpg"),
              ),
              title: Text(mentor.mentorName),
            ),
          );
        },
        itemCount: mentorsList.length,
      );
}