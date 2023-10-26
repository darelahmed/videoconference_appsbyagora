import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoconference_appsbyagora/ui/join_withcode.dart';
import 'package:videoconference_appsbyagora/ui/new_meeting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 100
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Flutter Video Conference",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "This Video Conference Apps is made",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "with Flutter and Agora SDK",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.video_call,
                size: 270,
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(NewMeeting());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(
                            width: 5
                        ),
                        Text(
                          "New meeting",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 350,
              height: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(JoinWithCode());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.code, color: Colors.black),
                        SizedBox(
                            width: 5
                        ),
                        Text(
                          "Join with code",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}