// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:terra_treasures/model/education_model.dart';
// import 'package:terra_treasures/model/user_model.dart';
// import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
// import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
// import 'package:terra_treasures/util/constants.dart';

// import 'package:uuid/uuid.dart';
// import 'package:video_player/video_player.dart'; // Add this import

// class EducationContent extends StatefulWidget {
//   EducationContent({super.key});

//   @override
//   State<EducationContent> createState() => _EducationContentState();
// }

// class _EducationContentState extends State<EducationContent> {
//   final firestore = FirebaseFirestore.instance;
//   File? selectedImage;
//   final _textController = TextEditingController();
//   final picker = ImagePicker();
//   String id = FirebaseAuth.instance.currentUser!.uid;

//   Future<void> _pickedImageGallery() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage == null) return;
//     setState(() {
//       selectedImage = File(pickedImage.path);
//     });
//   }

//   Future<void> _pickedVideoGallery() async {
//     final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
//     if (pickedVideo == null) return;
//     setState(() {
//       selectedImage = File(pickedVideo.path);
//     });
//   }

//   Future<void> _postContent(String type) async {
//     String postId = const Uuid().v4(); // Generate a unique ID for the post
//     String content = '';
//     if (type == 'text') {
//       content = _textController.text;
//     } else if (type == 'image' || type == 'video') {
//       // For simplicity, we'll use the file path as content. In a real app, you should upload the file to a storage service and use the file URL.
//       content = selectedImage!.path;
//     }

//     PostModel post = PostModel(
//       id: postId,
//       userId: id,
//       content: content,
//       type: type,
//       timestamp: DateTime.now(),
//     );

//     await firestore.collection('education').doc(postId).set(post.toMap());

//     setState(() {
//       _textController.clear();
//       selectedImage = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         leading: Padding(
//           padding: const EdgeInsets.only(top: 15, left: 20),
//           child: StreamBuilder(
//             stream: firestore.collection('register').doc(id).snapshots(),
//             builder: ((context, snapshot) {
//               if (!snapshot.hasData) return const CircularProgressIndicator();
//               UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
//               String image = userModel.imageUrl.toString();
//               return CircleAvatar(
//                 backgroundImage: NetworkImage(image),
//               );
//             }),
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(top: 15, left: 30),
//           child: StreamBuilder(
//             stream: firestore.collection('register').doc(id).snapshots(),
//             builder: ((context, snapshot) {
//               if (!snapshot.hasData) return const CircularProgressIndicator();
//               UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
//               return Text(
//                 userModel.name,
//                 style: GoogleFonts.inder(),
//               );
//             }),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     title: Text("Create Post", style: GoogleFonts.inder(color: const Color(0xff0FA779))),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: _textController,
//                           decoration: const InputDecoration(hintText: 'Enter text'),
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 _pickedImageGallery();
//                                 Navigator.of(ctx).pop();
//                               },
//                               icon: const Icon(Icons.image),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 _pickedVideoGallery();
//                                 Navigator.of(ctx).pop();
//                               },
//                               icon: const Icon(Icons.videocam),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_textController.text.isNotEmpty) {
//                             _postContent('text');
//                             Navigator.of(ctx).pop();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                         child: Text(
//                           "POST TEXT",
//                           style: GoogleFonts.inder(color: Colors.white),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (selectedImage != null) {
//                             _postContent('image');
//                             Navigator.of(ctx).pop();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                         child: Text(
//                           "POST IMAGE",
//                           style: GoogleFonts.inder(color: Colors.white),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (selectedImage != null) {
//                             _postContent('video');
//                             Navigator.of(ctx).pop();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                         child: Text(
//                           "POST VIDEO",
//                           style: GoogleFonts.inder(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Text(
//                 "Post",
//                 style: GoogleFonts.inder(color: const Color(0xff0FA779)),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: firestore.collection('education').orderBy('timestamp', descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return const CircularProgressIndicator();
//           List<PostModel> posts = snapshot.data!.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
//           return SingleChildScrollView(
//             child: Column(
//               children: posts.map((post) {
//                 return Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       StreamBuilder(stream:firestore.collection("register").doc(id).snapshots(), 
//                       builder: (context,snapshot)
//                       {
//                         UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
//                         return Row(
//                         children: [
//                           const CircleAvatar(),
//                           Padding(
//                             padding: const EdgeInsets.all(15),
//                             child: Text(userModel.name, style: GoogleFonts.inder())
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 180),
//                            child: IconButton(onPressed: (){}, 
//                            icon: const Icon(Icons.delete,color: Colors.grey,size: 20,)),
//                          )

//                         ],
//                       );
//                       }
                       
//                       ),
                      
//                       if (post.type == 'text') ...[
//                         Text(post.content, style: GoogleFonts.inder()),
//                       ] else if (post.type == 'image') ...[
//                         Image.file(File(post.content)),
//                       ] else if (post.type == 'video') ...[
//                          VideoWidget(videoPath: post.content), 
//                         // Container(
//                         //   height: 200,
//                         //   color: Colors.black12,
//                         //   child: const Center(
//                         //     child: Icon(Icons.videocam, size: 50, color: Colors.black38),
//                         //   ),
//                         // ),
//                       ],
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.favorite_border_outlined),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.comment),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.share),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         barColor: kPrimaryColor,
//         bottomBarCenterModel: BottomBarCenterModel(
//           centerBackgroundColor: Colors.white,
//           centerIcon: const FloatingCenterButton(
//             child: Icon(Icons.move_up_rounded, color: kPrimaryColor),
//           ),
//           centerIconChild: [
//             FloatingCenterButtonChild(
//               child: const Icon(Icons.school, color: kPrimaryColor),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EducationContent()),
//                 );
//               },
//             ),
//             FloatingCenterButtonChild(
//               child: const Icon(Icons.shopping_bag_outlined, color: kPrimaryColor),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const CartPage()),
//                 );
//               },
//             ),
//             FloatingCenterButtonChild(
//               child: const Icon(Icons.quiz, color: kPrimaryColor),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const QuizHome()),
//                 );
//               },
//             ),
//             FloatingCenterButtonChild(
//               child: const Icon(Icons.question_mark_outlined, color: kPrimaryColor),
//               onTap: () {},
//             ),
//           ],
//         ),
//         bottomBar: const [
//           BottomBarItem(
//             icon: Icon(Icons.home, color: Colors.white),
//             iconSelected: Icon(Icons.home),
//             title: "Home",
//             titleStyle: TextStyle(color: AppColors.white),
//             dotColor: Colors.white,
//           ),
//           BottomBarItem(
//             icon: Icon(Icons.people_alt, color: Colors.white),
//             iconSelected: Icon(Icons.people_alt),
//             title: "Community",
//             titleStyle: TextStyle(color: AppColors.white),
//             dotColor: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }


// class VideoWidget extends StatefulWidget {
//   final String videoPath;

//   const VideoWidget({required this.videoPath});

//   @override
//   _VideoWidgetState createState() => _VideoWidgetState();
// }

// class _VideoWidgetState extends State<VideoWidget> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//         : Container(
//             height: 200,
//             color: Colors.black12,
//             child: const Center(
//               child: Icon(Icons.videocam, size: 50, color: Colors.black38),
//             ),
//           );
//   }
// }



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/model/education_model.dart';// Make sure to import your PostModel
import 'package:terra_treasures/model/user_model.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
import 'package:terra_treasures/util/constants.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class EducationContent extends StatefulWidget {
  
  EducationContent({super.key});

  @override
  State<EducationContent> createState() => _EducationContentState();
}

class _EducationContentState extends State<EducationContent> {
  final firestore = FirebaseFirestore.instance;
  File? selectedImage;
  final _textController = TextEditingController();
  final picker = ImagePicker();
  String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> _pickedImageGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
    });
  }

  Future<void> _pickedVideoGallery() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo == null) return;
    setState(() {
      selectedImage = File(pickedVideo.path);
    });
  }

  Future<void> _postContent(String type) async {
    String postId = const Uuid().v4();
    String content = '';
    if (type == 'text') {
      content = _textController.text;
    } else if (type == 'image' || type == 'video') {
      content = selectedImage!.path;
    }

    PostModel post = PostModel(
      id: postId,
      userId: id,
      content: content,
      type: type,
      timestamp: DateTime.now(),
      likes: [], // Initialize likes as an empty list
    );

    await firestore.collection('education').doc(postId).set(post.toMap());

    setState(() {
      _textController.clear();
      selectedImage = null;
    });
  }

  Future<void> _deletePost(String postId) async {
    await firestore.collection('education').doc(postId).delete();
  }

  Future<void> _likePost(String postId, String userId) async {
    DocumentSnapshot doc = await firestore.collection('education').doc(postId).get();
    List likes = (doc.data() as Map)['likes'];

    if (likes.contains(userId)) {
      likes.remove(userId);
    } else {
      likes.add(userId);
    }

    await firestore.collection('education').doc(postId).update({'likes': likes});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20),
          child: StreamBuilder(
            stream: firestore.collection('register').doc(id).snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
              String image = userModel.imageUrl.toString();
              return CircleAvatar(
                backgroundImage: NetworkImage(image),
              );
            }),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15, left: 30),
          child: StreamBuilder(
            stream: firestore.collection('register').doc(id).snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
              return Text(
                userModel.name,
                style: GoogleFonts.inder(),
              );
            }),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Create Post", style: GoogleFonts.inder(color: const Color(0xff0FA779))),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _textController,
                          decoration: const InputDecoration(hintText: 'Enter text'),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _pickedImageGallery();
                                Navigator.of(ctx).pop();
                              },
                              icon: const Icon(Icons.image),
                            ),
                            IconButton(
                              onPressed: () {
                                _pickedVideoGallery();
                                Navigator.of(ctx).pop();
                              },
                              icon: const Icon(Icons.videocam),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (_textController.text.isNotEmpty) {
                            _postContent('text');
                            Navigator.of(ctx).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                        child: Text(
                          "POST TEXT",
                          style: GoogleFonts.inder(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedImage != null) {
                            _postContent('image');
                            Navigator.of(ctx).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                        child: Text(
                          "POST IMAGE",
                          style: GoogleFonts.inder(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedImage != null) {
                            _postContent('video');
                            Navigator.of(ctx).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                        child: Text(
                          "POST VIDEO",
                          style: GoogleFonts.inder(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                "Post",
                style: GoogleFonts.inder(color: const Color(0xff0FA779)),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: firestore.collection('education').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          List<PostModel> posts = snapshot.data!.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
          return SingleChildScrollView(
            child: Column(
              children: posts.map((post) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      StreamBuilder(
                        stream: firestore.collection("register").doc(id).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return const CircularProgressIndicator();
                          UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
                          return Row(
                            children: [
                              const CircleAvatar(),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(userModel.name, style: GoogleFonts.inder()),
                              ),
                              Spacer(),
                              if (post.userId == id) // Show delete button only for the post creator
                                IconButton(
                                  onPressed: () {
                                    _deletePost(post.id);
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.grey, size: 20),
                                )
                            ],
                          );
                        },
                      ),
                      if (post.type == 'text') ...[
                        Text(post.content, style: GoogleFonts.inder()),
                      ] else if (post.type == 'image') ...[
                        Image.file(File(post.content)),
                      ] else if (post.type == 'video') ...[
                        VideoWidget(videoPath: post.content),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              _likePost(post.id, id);
                            },
                            icon: Icon(
                              post.likes.contains(id) ? Icons.favorite : Icons.favorite_border_outlined,
                              color: post.likes.contains(id) ? Colors.red : null,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.comment),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: kPrimaryColor,
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.white,
          centerIcon: const FloatingCenterButton(
            child: Icon(Icons.move_up_rounded, color: kPrimaryColor),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(Icons.school, color: kPrimaryColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationContent()),
                );
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(Icons.shopping_bag_outlined, color: kPrimaryColor),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  CartPage()),
                // );
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(Icons.quiz, color: kPrimaryColor),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const QuizHome()),
                // );
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(Icons.question_mark_outlined, color: kPrimaryColor),
              onTap: () {},
            ),
          ],
        ),
        bottomBar: const [
          BottomBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            iconSelected: Icon(Icons.home),
            title: "Home",
            titleStyle: TextStyle(color: AppColors.white),
            dotColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.people_alt, color: Colors.white),
            iconSelected: Icon(Icons.people_alt),
            title: "Community",
            titleStyle: TextStyle(color: AppColors.white),
            dotColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String videoPath;

  const VideoWidget({required this.videoPath});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container(
            height: 200,
            color: Colors.black12,
            child: const Center(
              child: Icon(Icons.videocam, size: 50, color: Colors.black38),
            ),
          );
  }
}
