import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Detalis extends StatelessWidget {
  const Detalis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF99CDA9),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: const Color(0xFF99CDA9),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 3,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/img/QR.png',
                      height: MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      iconColor: Color(0xFF14586E),
                      leading: Icon(Icons.check_circle),
                      title: Text(
                        'LaDonna Center',
                        style: TextStyle(
                          color: Color(0xFF14586E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      iconColor: Color(0xFF14586E),
                      leading: Icon(Icons.check_circle),
                      title: Text(
                        'Order Number: 112',
                        style: TextStyle(
                          color: Color(0xFF14586E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      iconColor: Color(0xFF14586E),
                      leading: Icon(Icons.check_circle),
                      title: Text(
                        'Locations:',
                        style: TextStyle(
                          color: Color(0xFF14586E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Your booking:',
                      style: TextStyle(
                          color: Color(0xFF14586E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: ListTile(
                      iconColor: Color(0xFF14586E),
                      leading: Icon(Icons.check_circle),
                      title: Text(
                        'Massage',
                        style: TextStyle(
                          color: Color(0xFF14586E),
                          fontSize: 16,
                        ),
                      ),
                      trailing: Chip(
                          backgroundColor: Color(0xFFC4C4C4),
                          label: Text(
                            'Today      8:00 P.M',
                            style: TextStyle(
                                color: Color(0xFF6B6B6B), fontSize: 11),
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: ListTile(
                      iconColor: Color(0xFF14586E),
                      leading: Icon(Icons.check_circle),
                      title: Text(
                        'Skin Care',
                        style: TextStyle(
                          color: Color(0xFF14586E),
                          fontSize: 16,
                        ),
                      ),
                      trailing: Chip(
                          backgroundColor: Color(0xFFC4C4C4),
                          label: Text(
                            'Today      8:00 P.M',
                            style: TextStyle(
                                color: Color(0xFF6B6B6B), fontSize: 11),
                          )),
                    ),
                  ),
                ]),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
