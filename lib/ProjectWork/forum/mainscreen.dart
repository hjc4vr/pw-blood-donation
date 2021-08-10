import 'package:flutter/material.dart';
import 'personalpage.dart';

class forum extends StatefulWidget {
  @override
  _forumState createState() => _forumState();
}

class _forumState extends State<forum> {
  @override
  static int page = 1;
  static Post the_post = post1;
  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageview= {
      1 : getMain(),
      3 : getComments(the_post.comments)
    };
    return pageview[page] as Widget;
  }

  Widget getComments(List<Comment> likes) {
    List<Widget> likers = [];
    DateTime now = DateTime.now();
    for (Comment comment in likes) {
      int hoursAgo = (now.hour) - (comment.dateOfComment.hour -1);
      likers.add(new Container(
        // height: 45,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundImage: comment.user.profilePicture,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: comment.user.username, style: textStyleBold),
                              new TextSpan(text: ' ', style: textStyle),
                              new TextSpan(text: comment.comment, style: textStyle),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 20),
                              child: Text(hoursAgo.toString() + "h", style: textStyleLigthGrey,),
                            ),
                            Container(
                              child: Text("like", style: textStyleLigthGrey,),
                              margin: EdgeInsets.only(right: 10, top: 20),
                            ),
                            Container(
                              child: Text("Reply", style: textStyleLigthGrey,),
                              margin: EdgeInsets.only(right: 10, top: 20),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Container(
                        child: Icon(Icons.favorite, color: Colors.black, size: 15,)),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: comment.isLiked ? Colors.black : Colors.white, size: 10),
                        onPressed: () {
                          setState(() {
                            comment.isLiked = comment.isLiked ? false : true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            onPressed: () {

            },
          )
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                    onPressed: () {
                      setState(() {
                        page = 1;
                        build(context);
                      });
                    },
                  ),
                  Text('Comments', style: textStyleBold,)
                ],
              ),

            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: likers,
        ),
      ),
    );
  }
  Widget getPost(BuildContext context, Post post, int index) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: CircleAvatar(backgroundImage: post.user.profilePicture,),
                      ),
                      Text(post.user.username,)
                    ],
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.more_horiz),
                  //   onPressed: () {
                  //
                  //   },
                  // )
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 1),
              color: Colors.grey,
            ),
            Container(
              constraints: BoxConstraints(
                  maxHeight: 282
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: post.image
                  )
              ),
            ),
            Center(child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment(0, 0),
                      children: <Widget>[
                        Icon(Icons.favorite, size: 30, color: post.isLiked ? Colors.red : Colors.black,),
                        IconButton(icon: Icon(Icons.favorite), color: post.isLiked ? Colors.red : Colors.white,
                          onPressed: () {
                            setState(() {
                              userPosts[index].isLiked = post.isLiked ? false : true;
                              if (!post.isLiked) {
                                post.likes.remove(user);
                              } else {
                                post.likes.add(user);
                              }
                            });
                          },)
                      ],
                    ),
                    Stack(
                      alignment: Alignment(0, 0),
                      children: <Widget>[
                        Icon(Icons.mode_comment, size: 30, color: Colors.black,),
                        IconButton(icon: Icon(Icons.mode_comment), color: Colors.white,
                          onPressed: () {

                          },)
                      ],
                    ),
                    // Stack(
                    //   alignment: Alignment(0, 0),
                    //   children: <Widget>[
                    //     Icon(Icons.send, size: 30, color: Colors.black,),
                    //     IconButton(icon: Icon(Icons.send), color: Colors.white,
                    //       onPressed: () {
                    //
                    //       },)
                    //   ],
                    // )
                  ],
                ),
                // Stack(
                //   alignment: Alignment(0, 0),
                //   children: <Widget>[
                //     Icon(Icons.bookmark, size: 30, color: Colors.black,),
                //     IconButton(icon: Icon(Icons.bookmark), color: post.isSaved ? Colors.black : Colors.white,
                //       onPressed: () {
                //         setState(() {
                //           userPosts[index].isSaved = post.isSaved ? false : true;
                //           if (!post.isSaved) {
                //             user.savedPosts.remove(post);
                //           } else {
                //             user.savedPosts.add(post);
                //           }
                //         });
                //       },)
                //   ],
                // )
              ],
            )),
            // FlatButton(
            //   child: Text(post.likes.length.toString() + " likes", style: textStyleBold),
            //   onPressed: () {
            //     setState(() {
            //       the_post = post;
            //       page = 2;
            //       build(context);
            //     });
            //   },
            // ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, right: 10),
                  child: Text(
                    post.user.username,
                    style: textStyleBold,
                  ),
                ),
                Text(
                  post.description,
                  style: textStyle,
                )
              ],
            ),
            FlatButton(
              child: Text("View all " + post.comments.length.toString() + " comments", style: textStyleLigthGrey),
              onPressed: () {
                setState(() {
                  the_post = post;
                  page = 3;
                  build(context);
                });
              },
            ),
          ],
        )
    );
  }
  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = [];
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(context, post, index));
      index ++;
    }
    return posts;
  }
  Widget getMain() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum", style: textStyleBold),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            print('yes');
            Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  ProfileApp()),
                );
          },
          child: Icon(
            Icons.person_rounded,
            color: Colors.black,// add custom icons also
          ),
        ),
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget> [
                  Column(
                    children: getPosts(context),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}

class Post {
  AssetImage image;
  String description;
  User user;
  List<User> likes;
  List<Comment> comments;
  DateTime date;
  bool isLiked;
  bool isSaved;

  Post(this.image, this.user, this.description, this.date, this.likes, this.comments, this.isLiked, this.isSaved);
}

class User {
  String username;
  List<Post> posts;
  AssetImage profilePicture;
  List<User> followers;
  List<User> following;
  List<Post> savedPosts;
  bool hasStory;

  User(this.username, this.profilePicture, this.followers, this.following, this.posts, this.savedPosts, this.hasStory);
}
class Comment {
  String comment;
  User user;
  DateTime dateOfComment;
  bool isLiked;
  Comment(this.user, this.comment, this.dateOfComment, this.isLiked);
}
List<Post> userPosts = [
  new Post(new AssetImage('images/post1.jpg'), user, "Donating makes me feel good!", DateTime.now(), [follower1, follower2, follower3, follower4, follower5, follower6], [
    new Comment(follower1, "How?", DateTime.now(), false),
    new Comment(follower2, "Cool one", DateTime.now(), false),
    new Comment(follower4, "share more?", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post2.jpeg'), follower1, "I visited the family of a beneficiary!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "touching!", DateTime.now(), false),
    new Comment(follower1, "I love this!", DateTime.now(), false),
    new Comment(user, "inspiring!", DateTime.now(), false),
    new Comment(follower5, "yea", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post3.jpeg'), follower5, "SRC nurses are the best!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "agree!", DateTime.now(), false),
    new Comment(follower1, "They are the best!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "agree", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post4.jpeg'), follower3, "Yes Im the guy you see on posters", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "Hahaha dude!", DateTime.now(), false),
    new Comment(follower1, "Omg its you!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "Huh", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post5.jpeg'), follower3, "my uncle first time donating!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "welcome!", DateTime.now(), false),
    new Comment(follower1, "Welcome to the club", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "wow", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post6.jpeg'), follower3, "Donation is love!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "HAHAHA!", DateTime.now(), false),
    new Comment(follower1, "Yeah!", DateTime.now(), false),
    new Comment(user, "indeed it is", DateTime.now(), false),
    new Comment(follower5, "cool", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post7.jpeg'), follower3, "Im so happy!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "cool!", DateTime.now(), false),
    new Comment(follower1, "I feel you!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "nice!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post8.jpeg'), follower3, "I feel like SRC is getting better!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "yeah!", DateTime.now(), false),
    new Comment(follower1, "They indeed are!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "agree!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('images/post9.jpeg'), follower3, "Love the nurses", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "Agree!", DateTime.now(), false),
    new Comment(follower1, "Same here!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "OK", DateTime.now(), false)
  ], false, false),
];


User follower1 = new User('John Wang (Gold)', AssetImage('images/profile1.jpeg'), [], [], [], [], true);
User follower2 = new User('Cardi A (Silver)', AssetImage('images/profile2.jpg'), [], [], [], [], false);
User follower3 = new User('Bob Chin (Medal for Life)', AssetImage('images/profile3.jpg'), [], [], [], [], true);
User follower4 = new User('KongfuCatty (Diamond)', AssetImage('images/profile4.jpg'), [], [], [], [], true);
User follower5 = new User('Karen (Champion of Champions)', AssetImage('images/profile5.jpg'), [], [], [], [], true);
User follower6 = new User('Ruby (Ruby)', AssetImage('images/profile6.jpg'), [], [], [], [], false);


final User user = new User('John Wick （Gold）', AssetImage('images/profile.jpg'), [
  follower1,
  follower2,
  follower3
], [
  follower1,
  follower2,
  follower3,
  follower4,
  follower5,
  follower6
], [], [], false);
TextStyle textStyle = new TextStyle(fontFamily: 'Gotham');
TextStyle textStyleBold = new TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLigthGrey = new TextStyle(fontFamily: 'Gotham', color: Colors.grey);

Post post1 = new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3], [], false, false);