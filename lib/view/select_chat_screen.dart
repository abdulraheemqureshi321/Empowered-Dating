import 'package:flutter/material.dart';

class SelectChatScreen extends StatefulWidget {
  const SelectChatScreen({super.key});

  @override
  State<SelectChatScreen> createState() => _SelectChatScreenState();
}

class _SelectChatScreenState extends State<SelectChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('Chat screen'),
      )
    );
  }
}
