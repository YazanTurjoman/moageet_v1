import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: const Color(0xff14586E),
        title: const Text(
          'Categories',
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemCount: 50,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5.0 / 4.0,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                  color: Colors.white,
                  borderOnForeground: true,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            "assets/img/image4.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Text(
                        "Name",
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff000000)),
                      ),
                    ],
                  )));
        },
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
