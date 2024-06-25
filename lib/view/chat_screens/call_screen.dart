import 'package:empowered_dating/view/chat_screens/video_call_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Call',style: TextStyle( fontSize: 16, color: Color(0xffACACAC),),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/3.png'),
                  ),
                  SizedBox(height: 15,),
                  Text('Patrica', style: TextStyle(fontSize: 28 , color: Color(0xff5E5E5E)),),
                  SizedBox(height: 15,),
                  Text('Calling', style: TextStyle(fontSize: 14 , color: Color(0xff5E5E5E)),)

                ],
              ),
            ),
            const Spacer(),
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
            const SizedBox(height: 15,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const VideoCallScreen()));
                    },
                    child: Container(
                      height: 63,
                      width: 64,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: const Icon(CupertinoIcons.video_camera, color: Color(0xffACACAC),size: 31,),
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
