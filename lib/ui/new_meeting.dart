import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:share/share.dart';
import 'package:videoconference_appsbyagora/ui/home_page.dart';
import 'package:videoconference_appsbyagora/video_call.dart';

class NewMeeting extends StatefulWidget {
  const NewMeeting({super.key});

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  String _meetingCode = "";
  @override
  void initState() {
    var uuid = Uuid();
    _meetingCode = uuid.v1().substring(0, 8);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    SizedBox(
                        width: 10
                    ),
                    IconButton(onPressed: (){
                      Get.to(HomePage());
                    }, icon: Icon(Icons.arrow_back_ios_sharp)),
                    SizedBox(
                        width: 5
                    ),
                    Text("Back", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.video_call,
                  size: 200,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                  height: 10
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Your meeting is ready",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                  height: 20
              ),
              //make textfield
              Container(
                width: 330,
                height: 70,
                child: Card(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                        leading: Icon(Icons.link, color: Colors.blue,),
                        title: SelectableText(
                          _meetingCode,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: _meetingCode));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Copied to Clipboard"),
                              ),
                            );
                          },
                          icon: Icon(Icons.copy, color: Colors.blue,),
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 330,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                width: 330,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Share.share("Join my meeting with this code : $_meetingCode");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: Colors.white),
                      SizedBox(
                          width: 10
                      ),
                      Text(
                        "Share Invite",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10
              ),
              Container(
                width: 330,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(VideoCall(channelName: _meetingCode.trim(),));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_call_rounded, color: Colors.black),
                      SizedBox(
                          width: 10
                      ),
                      Text(
                        "Start Call",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}