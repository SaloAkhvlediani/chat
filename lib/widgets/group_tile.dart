import 'package:chatapp_firebase2/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../pages/auth/chat_page.dart';

class GrpupTile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;
  const GrpupTile(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);

  @override
  State<GrpupTile> createState() => _GrpupTileState();
}

class _GrpupTileState extends State<GrpupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            ChatPage(
              groupId: widget.groupId,
              groupName: widget.groupName,
              userName: widget.userName,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              widget.groupName.substring(0, 2).toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          title: Text(widget.groupName,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
            "Join the conversation as ${widget.userName}",
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
    // return ListTile(
    //   title: Text(widget.groupId),
    //   subtitle: Text(widget.groupName),
    // );
  }
}
