import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authenticate.dart';
import 'users.dart';
import 'convo.dart';

class Chat extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

String id = Authenticate().user();
CollectionReference users = FirebaseFirestore.instance.collection('users');

class _ChatPageState extends State<Chat> {
  List<Users> chatUsers = [
    Users(name: "Alicia Keys", messageText: "I keep on falling", imageURL: "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_941,c_fill,g_auto,h_529,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200806120231-alicia-keys-elf-cosmetics.jpg", time: "Now"),
    Users(name: "Bob Marley", messageText: "Is this love?", imageURL: "https://m.media-amazon.com/images/M/MV5BMTM0MzM3MTg3MF5BMl5BanBnXkFtZTcwNDcwODE0Nw@@._V1_UX214_CR0,0,214,317_AL_.jpg", time: "Yesterday"),
    Users(name: "Jay Z", messageText: "Allow me to reintroduce myself", imageURL: "https://www.rollingstone.com/wp-content/uploads/2021/10/jay-z-trial.jpg?resize=1800,1200&w=1200", time: "31 Oct"),
    Users(name: "Kendrick Lamar", messageText: "Halle Berry or hallelujah", imageURL: "https://media.newyorker.com/photos/5ad6313540fc7c73d830a3a8/master/w_960,c_limit/St-Felix-Kendrick-Lamar-Pulitzer.jpg", time: "23 Oct"),
    Users(name: "NWA", messageText: "F*** the police", imageURL: "https://www.rollingstone.com/wp-content/uploads/2018/08/NWA-10-things-you-didnt-know.jpg?resize=1800,1200&w=1200", time: "12 Oct"),
    Users(name: "Tina Turner", messageText: "What's love got to do with it?", imageURL: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTgwNTMwNjYzNjg0ODQyODU2/tina-turner.jpg", time: "22 Sept"),
    Users(name: "Whitney Houston", messageText: "I wanna dance with somebody", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Whitney_Houston_%28cropped3%29.JPEG/220px-Whitney_Houston_%28cropped3%29.JPEG", time: "1 Sept"),
    Users(name: "Will Smith", messageText: "The Pursuit of Happyness",imageURL: "https://media1.popsugar-assets.com/files/thumbor/cAHcieCgYfMQ_0DiJzQK5nTyNjQ/613x51:2226x1664/fit-in/500x500/filters:format_auto-!!-:strip_icc-!!-/2020/10/26/001/n/1922398/c8450c525f97556842e0e2.16322452_/i/Will-Smith.jpg", time: "16 Aug"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lime,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.blue,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
              ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Conversation(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}