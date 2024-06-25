import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Video Call',style: TextStyle( fontSize: 16, color: Color(0xffFFFFFF),),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.camera_alt_outlined, color: Colors.white,size: 31,),
          )
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/video_call1.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20),
              child: Container(
                height: 183,
                width: 137,
                decoration:  BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/video_call2.png'),
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 63,
                    width: 64,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: const Icon(CupertinoIcons.volume_up, color: Color(0xffACACAC),size: 31,),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 92,
                      width: 92,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff934C93)
                      ),
                      child: const Icon(CupertinoIcons.phone_down, color: Colors.white,size: 42,),
                    ),
                  ),
                  Container(
                    height: 63,
                    width: 64,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: const Icon(CupertinoIcons.mic_off, color: Color(0xffACACAC),size: 31,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
