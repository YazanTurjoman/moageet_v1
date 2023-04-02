import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: const Color(0xff14586E),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    child:
                        Icon(Icons.person, size: BorderSide.strokeAlignCenter),
                  ),
                  const Text('Jhon due',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                  const Text('Email@gmail.com',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff99CDA9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Order Number',
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
                Text('2',
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18)),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(45))),
            height: MediaQuery.of(context).size.height * 0.4,
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
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
      bottomNavigationBar: const BottomBar(),
    );
  }
}
