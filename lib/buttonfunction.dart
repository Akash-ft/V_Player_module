import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

// Layout for comment box
class AddComment extends StatelessWidget {
  final Function addComment;

  AddComment(this.addComment);

  @override
  Widget build(BuildContext context) {
    String? newCommentadd;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Comments Box",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (newComment) {
                newCommentadd = newComment;
              },
              autofocus: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                addComment(newCommentadd);
              },
              child: Text("Add Comment "),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
