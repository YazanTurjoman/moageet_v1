import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  bool selectd = true;
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
            child: Image.asset(
              "assets/img/Frame1.png",
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      selectd = false;
                    });
                  },
                  child: const Text('Active')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      selectd = true;
                    });
                  },
                  child: const Text('Passed'))
            ],
          ),
          selectd
              ? const Text('Passed')
              : Expanded(
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
                            backgroundImage:
                                AssetImage('assets/img/image7.png'),
                            backgroundColor: Colors.white,
                          ),
                          title: Center(
                            child: Text('LaDonna Center',
                                style: TextStyle(
                                    color: Color(0xffB5B5B5),
                                    letterSpacing: 2)),
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
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                          title: Center(
                            child: Text('Taj Spa',
                                style: TextStyle(
                                    color: Color(0xffB5B5B5),
                                    letterSpacing: 2)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
      bottomNavigationBar: BottomBar(currentIndex: 3),
    );
  }
}
