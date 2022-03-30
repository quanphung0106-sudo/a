import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_drawer_header.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/chatbot-uda-rvfq-576d4bb23a83.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "UDA Chat Bot",
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: messsages.length,
              itemBuilder: (context, index) => chat(
                  messsages[index]["message"].toString(),
                  messsages[index]["data"]),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.green,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: messageInsert,
                    decoration: InputDecoration.collapsed(
                      hintText: "Send your message...",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 30.0,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        if (messageInsert.text.isEmpty) {
                          print("empty message");
                        } else {
                          setState(() {
                            messsages.insert(
                                0, {"data": 1, "message": messageInsert.text});
                          });
                          response(messageInsert.text);
                          messageInsert.clear();
                        }
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    drawer: Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              MyHeaderDrawer (),
              InforPage(),

            ],
          ),
        ),
      ),
    ),
    );
  }
}

Widget chat(String message, int data) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Bubble(
        radius: Radius.circular(15.0),
        color: data == 0 ? Colors.indigo : Colors.deepPurpleAccent,
        elevation: 8.0,
        alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
        nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(
                    data == 0 ? "assets/bot.png" : "assets/user.png"),
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                  child: Text(
                message,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ))
            ],
          ),
        )),
  );
}

Widget InforPage() {
  return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(15),
          child: FlatButton(
            textColor: Colors.white,
            height: 45.0,
            color: Colors.green[400],
            onPressed: () {
              _officialWebsite();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    MaterialIcons.wifi,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Website chính thức',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          child: FlatButton(
            textColor: Colors.white,
            height: 45.0,
            color: Colors.blue[400],
            onPressed: () {
              _facebook();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesome.facebook_official,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Facebook của trường',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          child: FlatButton(
            textColor: Colors.white,
            height: 45.0,
            color: Colors.red[400],
            onPressed: () {
              _youtube();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesome.youtube_play,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Chanel Youtube của trường',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          child: FlatButton(
            textColor: Colors.white,
            height: 45.0,
            color: Colors.red[400],
            onPressed: () {
              _intro();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesome.youtube_play,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '1 ngày làm sinh viên',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),

      ]));
}

_facebook() async {
  const url = 'https://www.facebook.com/daihocdonga';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_youtube() async {
  const url = 'https://www.youtube.com/user/dongadanang';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_intro() async {
  const url = 'https://youtu.be/gT8qmDhRmpE';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_officialWebsite() async {
  const url = 'https://donga.edu.vn/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
