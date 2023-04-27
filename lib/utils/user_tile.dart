import 'package:flutter/material.dart';

class UserTile extends StatefulWidget {
  final String fullname;
  final String username;
  final String speciality;
  const UserTile({Key? key,
    required this.fullname,
    required this.username, //userId
    required this.speciality,
  }) : super(key: key);

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*nextScreen(context, ChatPage(
            groupId: widget.groupId,
            groupName: widget.groupName,
            userName: widget.username));*/
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(widget.fullname.substring(0,1).toUpperCase(), textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          title: Text(
            widget.fullname,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.speciality,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
