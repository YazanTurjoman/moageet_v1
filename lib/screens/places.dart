import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moageet/screens/place_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/place.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  bool map = false;
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
  void initState() {
    getcat();

    super.initState();
  }

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
        title: Wrap(
          children: [
            const Text(
              'Categories',
            ),
            CupertinoSwitch(
              value: map,
              onChanged: (value) {
                setState(() {
                  map = value;
                });
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemCount: isLoadig ? 0 : catg.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5.0 / 4.0,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlaceDetails(
                                p: Place.fromJson(catg[index]),
                              )));
                },
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
                        Text(
                          catg[index]['name'],
                          style: const TextStyle(
                              fontSize: 14.0, color: Color(0xff000000)),
                        ),
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
