import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final double imageSize;
  const AvatarButton({Key key, this.imageSize = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.black26,
                    offset: Offset(0, 20)),
              ]),
          child: ClipOval(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXp3DxP80ArpRzsB0XWBG9Ow5GeuefbLrUHw&usqp=CAU',
              width: this.imageSize,
              height: this.imageSize,
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 0,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  color: Colors.pinkAccent,
                  shape: BoxShape.circle,
                ),
              ),
              onPressed: () {},
            ))
      ],
    );
  }
}
