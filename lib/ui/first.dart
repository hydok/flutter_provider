import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
        ),

        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: Container(
              color: Colors.white,
              height:MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text('1'),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
