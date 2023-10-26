import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoconference_appsbyagora/ui/home_page.dart';
import 'package:videoconference_appsbyagora/video_call.dart';

class JoinWithCode extends StatefulWidget {
  const JoinWithCode({super.key});

  @override
  State<JoinWithCode> createState() => _JoinWithCodeState();
}

class _JoinWithCodeState extends State<JoinWithCode> {

  TextEditingController _controller = TextEditingController();

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
                    Icons.code_rounded,
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
                    "Enter meeting code below",
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
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'example : 132-134-234',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    )
                ),
                Container(
                  width: 330,
                  height: 50,
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(VideoCall(channelName: _controller.text.trim(),));
                    },
                    child: Text(
                      "Join Meeting",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}