import "package:flutter/material.dart";
import "package:v_player/comment_list.dart";

class CommentsList extends StatefulWidget {
  late final List<Comments> comments;

  CommentsList(this.comments);

  @override
  _CommentsListState createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CommentTile(comment: widget.comments[index].comment);
      },
      itemCount: widget.comments.length,
    );

    //Hard coded list view
    // return ListView(
    //   children: [
    //     ListTile(
    //       leading: Text(
    //         "Comment Box",
    //         style: TextStyle(fontSize: 25, color: Colors.white),
    //       ),
    //     ),
    //     CommentTile(comment: comments[0].comment),
    //     CommentTile(comment: comments[1].comment),
    //     CommentTile(comment: comments[2].comment),
    //     CommentTile(comment: comments[3].comment),
    //     CommentTile(comment: comments[4].comment),
    //   ],
    // );
  }
}

class CommentTile extends StatelessWidget {
  late final String comment;

  CommentTile({required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05)),
      style: ListTileStyle.list,
      leading: Icon(Icons.people_rounded),
      title: Text(
        comment,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
