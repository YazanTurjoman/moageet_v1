import 'package:shared_preferences/shared_preferences.dart';

import '../models/place.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlaceDetails extends StatefulWidget {
  Place p;
  PlaceDetails({
    required this.p,
    super.key,
  });

  @override
  State<PlaceDetails> createState() => _PlacesState();
}

class _PlacesState extends State<PlaceDetails> {
  @override
  void initState() {
    getcat();
    super.initState();
  }

  late Map data;
  late List catg;
  bool isLoadig = true;

  Future<Place> getcat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String h = prefs.get('token').toString();
    final response = await http.get(
      Uri.parse(
          'http://192.168.0.179:8084/api/v1/t_companies/?pageNo=1&pageSize=100'),
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
      return Place.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: const Color(0xff14586E),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(widget.p.name.toString()),
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/img/image4.png",
                width: 50,
                height: 50,
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff99CDA9),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                color: const Color(0xff99CDA9),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'La Donna is the first and only Italian center in Riyadh for ladies. Its professional staff greets you to an unforgettable experience in fully equipped salon and SPA area where beauty and wellness are combined in customized solutions.',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Our Services',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xff14586E),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(45))),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              tileColor: const Color(0xffF1F1F1),
                              iconColor: const Color(0xffB5B5B5),
                              title: Text(widget.p.phone.toString(),
                                  style: const TextStyle(
                                      color: Color(0xffB5B5B5), fontSize: 18)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              tileColor: Color(0xffF1F1F1),
                              title: Text('Massage',
                                  style: TextStyle(
                                      color: Color(0xffB5B5B5), fontSize: 18)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              tileColor: Color(0xffF1F1F1),
                              iconColor: Color(0xffB5B5B5),
                              title: Text('Massage',
                                  style: TextStyle(
                                      color: Color(0xffB5B5B5), fontSize: 18)),
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
                          Container(
                            alignment: Alignment.bottomRight,
                            color: Colors.white,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFF14586E),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
