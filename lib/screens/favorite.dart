import 'package:flutter/material.dart';
import 'package:moageet/components/battom_bar.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 4.5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: const Color(0xff14586E),
        title: const Text(
          'Favorites',
        ),
        centerTitle: true,
        actions: [
          Positioned(
            bottom: 0,
            right: -5,
            height: 50,
            child: Image.asset(
              "img/Frame.png",
            ),
          )
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(15), children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            tileColor: Color(0xffF1F1F1),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/img/image7.png'),
              backgroundColor: Color(0xffffffff),
            ),
            title: Center(
              child: Text('LaDonna Center',
                  style: TextStyle(color: Color(0xffB5B5B5), letterSpacing: 2)),
            ),
            trailing: Icon(Icons.favorite, color: Color(0xffEC6568)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            tileColor: Color(0xffF1F1F1),
            leading: CircleAvatar(
              backgroundImage: AssetImage('img/image6.png'),
              backgroundColor: Color(0xffffffff),
            ),
            title: Center(
              child: Text('Taj Spa',
                  style: TextStyle(color: Color(0xffB5B5B5), letterSpacing: 2)),
            ),
            trailing: Icon(Icons.favorite, color: Color(0xffEC6568)),
          ),
        ),
      ]),
      bottomNavigationBar: BottomBar(currentIndex: 2),
    );
  }
}
