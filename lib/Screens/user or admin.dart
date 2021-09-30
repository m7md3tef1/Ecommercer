import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class useroradminScreen extends StatefulWidget {
  const useroradminScreen({Key key}) : super(key: key);

  @override
  _useroradminScreenState createState() => _useroradminScreenState();
}

class _useroradminScreenState extends State<useroradminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              child: Center(
                child: SizedBox(
                  height: .35.sh,
                  width: .5.sw,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'AdminScreen');
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: AssetImage('image/100.jpg'),
                        ),
                        Text(
                          'Admin',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Container(
              child: Center(
            child: SizedBox(
              height: .35.sh,
              width: .5.sw,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'HomeScreen');
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      backgroundImage: AssetImage('image/user.png'),
                    ),
                    Text(
                      'User',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
