import 'package:flutter/material.dart';
import 'package:v_player/comment.dart';
import 'package:video_player/video_player.dart';
import 'package:v_player/buttonfunction.dart';
import 'package:share_plus/share_plus.dart';
import 'package:v_player/comment_list.dart';

class MyVideoPlayer extends StatefulWidget {
  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  bool active = false;
  bool active2 = false;
  bool active3 = false;
  String asset = 'asset/videoplayback.mp4';

  // String youtube = "https://youtu.be/syFZfO_wfMQ";
  //Set up the controller for the videoplayer.
  VideoPlayerController? controller;

  List<Comments> comments = [
    Comments(comment: "Nize"),
  ];

  //Setting up a intail-state for the player.
  @override
  void initState() {
    //Overriding the initstate from the super class
    super.initState();
    //controller is assigned to videoPlayer package and get the video from the asset
    controller = VideoPlayerController.asset(asset)
      // *..refer casceding operator*
      //initialize methoed is used to load the asset into the screen
      //then methoed is used to tell the code what to do next
      ..initialize().then((_) {
        setState(() {});
      });
    // telling the contriller to play the video
    // controller!.play();
  }

  @override
  void dispose() {
    //dispose method is used to clear all the widget once its done.
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.lightBlueAccent,
          child: Container(
            width: 500,
            height: 500,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //To check the controller has initialized with a video.
                //Ternary operator is been used instead of if-else.
                //ApectRation is used to set a properly ratio for screen size.

                Positioned(
                  left: 10,
                  right: 10,
                  top: 10,
                  child: controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controller!.value.aspectRatio,
                          //video
                          child: VideoPlayer(controller!),
                        )
                      //circularprogressindicator will appeare if the video file is not loaded.
                      : Container(
                          height: 200,
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
                SizedBox(
                  height: 05,
                ),
                Positioned(
                  top: 215,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                active = !active;
                              });
                            },
                            icon: Icon(
                              active
                                  ? Icons.thumb_up_alt
                                  : Icons.thumb_up_alt_outlined,
                              color: Colors.blue.shade800,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 05.0,
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => SingleChildScrollView(
                                          child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: AddComment((newCommentadd) {
                                          setState(() {
                                            comments.add(Comments(
                                                comment: newCommentadd));
                                          });
                                          Navigator.pop(context);
                                        }),
                                      )));
                              setState(() {
                                active2 = !active2;
                              });
                            },
                            icon: Icon(
                              active2
                                  ? Icons.chat_rounded
                                  : Icons.chat_outlined,
                              color: Colors.blue.shade800,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 05.0,
                          ),
                          IconButton(
                            onPressed: () async {
                              await Share.share("Enjoy the videos");
                              setState(() {
                                active3 = !active3;
                              });
                            },
                            icon: Icon(
                              active3
                                  ? Icons.share_sharp
                                  : Icons.share_outlined,
                              color: Colors.blue.shade800,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.blue.shade600,
                        onPressed: () {
                          setState(() {
                            if (controller!.value.isPlaying) {
                              controller!.pause();
                            } else {
                              controller!.play();
                            }
                          });
                        },
                        child: Icon(controller!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    width: 350,
                    height: 200,
                    child: CommentsList(comments.reversed.toList()),
                    // ListView(
                    //   children: [
                    //     // SizedBox(
                    //     //   height: 10,
                    //     // ),
                    //     // Text(
                    //     //   "Comment Box",
                    //     //   textAlign: TextAlign.center,
                    //     //   style: TextStyle(color: Colors.white, fontSize: 25),
                    //     // ),
                    //     // CommentsList(),
                    //     // ListTile(
                    //     //   style: ListTileStyle.list,
                    //     //   tileColor: Colors.blue.shade400,
                    //     //   contentPadding: EdgeInsets.all(08),
                    //     //   leading: Text(
                    //     //     "Hello world",
                    //     //     style: TextStyle(color: Colors.white),
                    //     //   ),
                    //     // ),
                    //     // ListTile(
                    //     //   leading: Text("Hello world"),
                    //     // ),
                    //     // ListTile(
                    //     //   leading: Text("Hello world"),
                    //     // ),
                    //     // ListTile(
                    //     //   leading: Text("Hello world"),
                    //     // ),
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       if (controller!.value.isPlaying) {
      //         controller!.pause();
      //       } else {
      //         controller!.play();
      //       }
      //     });
      //   },
      //   child:
      //       Icon(controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
    );
  }
}
