import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
          'Booking',
        ),
        centerTitle: true,
        actions: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/img/Frame1.png",
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(onPressed: () {}, child: const Text('Active')),
              TextButton(onPressed: () {}, child: const Text('Passed'))
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
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
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/img/image7.png'),
                    ),
                    title: Center(
                      child: Text('LaDonna Center',
                          style: TextStyle(
                              color: Color(0xffB5B5B5), letterSpacing: 2)),
                    ),
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
                    leading: CircleAvatar(),
                    title: Center(
                      child: Text('Taj Spa',
                          style: TextStyle(
                              color: Color(0xffB5B5B5), letterSpacing: 2)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
