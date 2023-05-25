import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moageet/screens/sub_categorie.dart';
import '../components/loadingbar.dart';
import 'package:http/http.dart' as http;
import '../models/categories.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Map data;
  late List catg;
  bool isLoadig = true;

  Future<categories> getcat() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost:8084/api/v1/t_categories/?pageNo=1&pageSize=100'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRGF0YSI6eyJ1c2VyIjoiYWRtaW4ifSwiaWF0IjoxNjg0NTk3NjY4LCJleHAiOjE2ODQ2MzM2Njh9.dEbhPwtDuL5QvloXRaPom9-dF8p_ZAgKLTe9phBjfWE'
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
      throw Exception('Failed to load album');
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
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: const Color(0xff14586E),
        title: const Text(
          'Categories',
        ),
      ),
      body: isLoadig
          ? const LoadingBar()
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10.0),
              itemCount: isLoadig ? 0 : catg.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 8.0 / 4.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubCategories(category: index.toString())));
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  catg[index]['name'],
                                  style: const TextStyle(
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
