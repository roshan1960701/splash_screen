import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:splash_screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController controller;
  bool startedPlaying = false;

  @override
  void initState() {
    controller = VideoPlayerController.asset("asset/HeyCloudy.mp4");
    started();
    controller.addListener(() {
      if (startedPlaying && !controller.value.isPlaying) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    });
    super.initState();
  }

  Future<bool> started() async {
    await controller.initialize();
    await controller.play();
    startedPlaying = true;
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    gradient:
    LinearGradient(colors: [Color(0xFF35c1f0), Color(0xFFbce7f5)])
    /*image: DecorationImage(
          image: new ExactAssetImage("asset/logo/launch.jpg"),
        ),*/
    ),
    child: VideoPlayer(controller),
    )


    );
  }
}
