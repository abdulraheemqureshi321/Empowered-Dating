import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xff934C93),
            borderRadius: BorderRadius.circular(31),
            border: Border.all(
              color: Color(0xffB6B6B6),
              width: 1,
            )
          ),
          child: const ListTile(
            title: Text('Chat with Someone'),
            trailing: Icon(Icons.add_circle),
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          decoration: BoxDecoration(
              color: Color(0xff934C93),
              borderRadius: BorderRadius.circular(31),
              border: Border.all(
                color: Color(0xffB6B6B6),
                width: 1,
              )
          ),
          child: const ListTile(
            title: Text('Partner'),
            trailing: Icon(Icons.add_circle),
          ),
        )
      ],
    );
  }
}
