import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moageet/models/Gendr.dart';
import 'dart:convert';
import '../../components/CustomRadio.dart';
import 'package:moageet/screens/authenticate/login.dart';
import 'package:moageet/screens/home/home.dart';

class Album {
  final String name;
  final String password;

  const Album({required this.name, required this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      password: json['password'],
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool visible = false;
  var temp;

  @override
  void dispose() {
    phoneNumber.dispose();
    otp.dispose();
    super.dispose();
  }

  Future<Album> createAlbum(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.179:8084/api/v1/t_users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRGF0YSI6eyJ1c2VyIjoiYWRtaW4ifSwiaWF0IjoxNjg0MjY0MjM1LCJleHAiOjE2ODQzMDAyMzV9.LZUY_P1jD0RZH_m4F0WxApy6jtEN-YGrB44y-CRzR9Q'
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return Album.fromJson(jsonDecode(response.body));
    }
  }

  List<Gender> genders = [];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Male", MdiIcons.genderMale, false));
    genders.add(Gender("Female", MdiIcons.genderFemale, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image.asset("assets/img/Polygon1.png"),
                Image.asset("assets/img/Rectangle.png"),
                const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 72,
                        color: Color(0xff14586E),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffEDEDED),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: Color(0xffB5B5B5),
                    ),
                    hintText: 'Name ',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffEDEDED),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xffB5B5B5),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffEDEDED),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Color(0xffB5B5B5),
                    ),
                    hintText: 'Phone ',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: genders.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.pinkAccent,
                        onTap: () {
                          setState(() {
                            genders
                                .forEach((gender) => gender.isSelected = false);
                            genders[index].isSelected = true;
                          });
                        },
                        child: CustomRadio(genders[index]),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color(0xFFFFCF02),
                ),
                onPressed: () {
                  createAlbum('yazan', 'password');
                },
                child: const Text(
                  'Sign Up ',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff14586E),
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'have an account ?'),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xff14586E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseAuthentication {
  String phoneNumber = "";

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+966$phoneNumber',
    );
    printMessage("OTP Sent to +966 $phoneNumber");
    return result;
  }

  authenticate(ConfirmationResult confirmationResult, String otp,
      BuildContext context) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);

    userCredential.additionalUserInfo!.isNewUser
        ? printMessage("Authentication Successful")
        : printMessage("User already exists");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}
