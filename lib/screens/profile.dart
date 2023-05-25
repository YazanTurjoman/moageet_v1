import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff99CDA9),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: const Color(0xff14586E),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: BorderSide.strokeAlignCenter,
                        color: Colors.black),
                  ),
                  Text('Jhon due',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                  Text('Email@gmail.com',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff99CDA9),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Order Number',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                  Text('2',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    tileColor: Color(0xffF1F1F1),
                    leading: Icon(Icons.abc),
                    iconColor: Color(0xffB5B5B5),
                    title: Text('Booking',
                        style:
                            TextStyle(color: Color(0xffB5B5B5), fontSize: 18)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    tileColor: Color(0xffF1F1F1),
                    leading: Icon(Icons.favorite_border_outlined),
                    title: Text('Favourites',
                        style:
                            TextStyle(color: Color(0xffB5B5B5), fontSize: 18)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    tileColor: Color(0xffF1F1F1),
                    iconColor: Color(0xffB5B5B5),
                    leading: Icon(Icons.settings),
                    title: Text('Edit your Info',
                        style:
                            TextStyle(color: Color(0xffB5B5B5), fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(currentIndex: 4),
    );
  }
}
