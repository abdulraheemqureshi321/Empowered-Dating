import 'package:empowered_dating/view/chat_screens/video_call_screen.dart';
import 'package:empowered_dating/widgets/profile_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'call_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            Container(
              height: 161,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xffACACAC),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/1.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lorem lpsum',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff5E5E5E))),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              'Online',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5E5E5E)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CallScreen()));
                        },
                        child: const Icon(
                          CupertinoIcons.phone,
                          color: Color(0xffFDB813),
                          size: 28,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VideoCallScreen()));
                        },
                        child: const Icon(
                          CupertinoIcons.video_camera,
                          color: Color(0xffFDB813),
                          size: 32,
                        ))
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ProfileTextFieldWidget(
                      text: 'write a message',
                      controller: controller,
                      keyboardType: TextInputType.text,
                      prefixIcon: CupertinoIcons.smiley,
                      suffixIcon: CupertinoIcons.camera,
                      filledColor: Colors.white,
                      prefixIconColor: const Color(0xffACACAC),
                      suffixIconColor: const Color(0xffACACAC),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 63,
                        width: 63,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff934C93)),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
