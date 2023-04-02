import 'package:flutter/material.dart';
import 'package:moageet/screens/places.dart';

class SubCategories extends StatelessWidget {
  final String category;
  const SubCategories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      const Color(0xff99CDA9),
      const Color(0xffEC6568),
      const Color(0xffFFCF02),
      const Color(0xff14586E)
    ];
    List<Color> colors2 = [
      const Color(0xffC5E3CE),
      const Color(0xffF4A7A9),
      const Color(0xffFFD72D),
      const Color(0xff51A3B6)
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: const Color(0xff14586E),
        title: Text(
          category,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 8.0 / 4.0,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Places()));
                },
                child: Card(
                    semanticContainer: true,
                    color: (index < 3 ? colors2[index] : colors2[(index % 4)])
                        .withOpacity(1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff14586E),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -5,
                          height: 50,
                          child: Image.asset(
                            "assets/img/Vector.png",
                            color: (index < 3
                                    ? colors[index]
                                    : colors[(index % 4)])
                                .withOpacity(.2),
                          ),
                        )
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
