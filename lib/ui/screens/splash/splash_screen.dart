import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //video controller
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/videos/splash.mp4',
    )
      ..initialize().then((_) {
        setState(() { });
         _playVideo();
      })
      ..setVolume(0.0);
     
       
  }

  void _playVideo() async {
    //playing video
    _controller.play();
    //add delay till video is complite
    await Future.delayed(const Duration(seconds: 4)); 
   //Next Page
    Navigator.pushNamed(context, '/');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(
              color: Colors.black,
              // width: 200,
              // height: 200,
            ),
      ),
    );
  }
}
