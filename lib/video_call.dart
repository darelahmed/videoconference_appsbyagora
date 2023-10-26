import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoCall extends StatefulWidget {
  String channelName = "Flutter Video Conference";

  VideoCall({Key? key, required this.channelName}) : super(key: key);
  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient _client;
  bool _loading = true;
  String token = "";

  Future<void> getToken() async {
    String link =
        "https://agora-node-tokenserver--darelahmedgalen.repl.co/access_token?channelName=${widget.channelName}";
    Response response = await get(Uri.parse(link));
    Map data = jsonDecode(response.body);
    setState(() {
      token = data['token'];
    });
  }

  @override
  void initState() {
    super.initState();
    getToken().then((_) {
      _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: 'a0ece652f146412688c4329651f319ec',
          tempToken: token,
          channelName: widget.channelName,
        ),
        enabledPermission: [
          Permission.camera,
          Permission.microphone,
        ],
      );
      return _client.initialize();
    }).then((_) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AgoraVideoViewer(client: _client),
                  AgoraVideoButtons(client: _client),
                ],
              ),
      ),
    );
  }
}
