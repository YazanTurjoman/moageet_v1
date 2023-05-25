import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moageet/components/loadingbar.dart';
import 'package:moageet/components/offers.dart';
import 'package:moageet/models/categories.dart';
import 'package:moageet/screens/LocationPage.dart';
import 'package:moageet/screens/details.dart';
import 'package:moageet/screens/profile.dart';
import 'package:moageet/screens/sub_categorie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../categories.dart';
import '../authenticate/token.dart';
import '../../components/battom_bar.dart';
import '../../components/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map data;
  late List catg;

  bool isLoadig = true;

  Future<categories> getcat() async {
    await fetchPost();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String h = prefs.get('token').toString();

    final response = await http.get(
      Uri.parse(
          'http://192.168.0.179:8084/api/v1/t_categories/?pageNo=1&pageSize=100'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $h'
      },
    );
    data = json.decode(response.body);
    catg = data['records'];

    setState(() {
      isLoadig = false;
    });
    if (response.statusCode == 200) {
      return categories.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed ');
    }
  }

  @override
  void initState() {
    getcat();

    super.initState();
  }

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
      drawer: drawer(context),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        backgroundColor: const Color(0xff14586E),
        title: const Text('Find a serves you want to have'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.person_2_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationPage()));
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  children: [
                    const Text(
                      'Offers',
                      style: TextStyle(
                          color: Color(0xff14586E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Detalis()));
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xff14586E),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Container(
                  child: offers(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                          color: Color(0xff14586E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Categories()));
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xff14586E),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isLoadig
                  ? const LoadingBar()
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: isLoadig ? 0 : catg.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4 / 2,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubCategories(
                                        category: catg[index]['name'])));
                          },
                          child: Card(
                              semanticContainer: true,
                              color: (index < 3
                                      ? colors2[index]
                                      : colors2[(index % 4)])
                                  .withOpacity(1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      catg[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff14586E),
                                          fontWeight: FontWeight.bold),
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
                        );
                      },
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 0),
    );
  }
}
