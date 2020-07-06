import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/boy.mp4');

  ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 9 / 20,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Expanded(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          Container(
            color: Colors.black54,
          ),
          Positioned(
            top: 70,
            left: 16,
            height: 42,
            width: 42,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Cowabunga\nplatform\nSport\nEvents'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 0.2,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Please log in to\nseize opportunities for\ncreate events',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 22,
                      letterSpacing: 0.2,
                      wordSpacing: 0.2,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.red,
                        onPressed: () {},
                        child: Text(
                          'Become an organizer',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black87,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
