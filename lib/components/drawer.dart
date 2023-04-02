import 'package:flutter/material.dart';
import 'package:moageet/screens/about_us.dart';
import 'package:moageet/screens/contact_us.dart';

Widget drawer(context) {
  return Drawer(
    child: ListView(padding: EdgeInsets.zero, children: [
      ListTile(
          leading: const Icon(Icons.arrow_back_ios, color: Color(0xffB5B5B5)),
          onTap: () => Navigator.pop(context)),
      ListTile(
        leading: const Icon(Icons.lock, color: Color(0xffB5B5B5)),
        title: const Text(
          'About us',
          style: TextStyle(
            color: Color(0xffB5B5B5),
            fontSize: 18,
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutUs()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.lock, color: Color(0xffB5B5B5)),
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: Color(0xffB5B5B5),
            fontSize: 18,
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactUs()));
        },
      ),
      ListTile(
          leading: const Icon(Icons.lock, color: Color(0xffB5B5B5)),
          title: const Text(
            'Praivacy',
            style: TextStyle(
              color: Color(0xffB5B5B5),
              fontSize: 18,
            ),
          ),
          onTap: () {}),
      ListTile(
          leading: const Icon(Icons.settings, color: Color(0xffB5B5B5)),
          title: const Text(
            'Setting',
            style: TextStyle(
              color: Color(0xffB5B5B5),
              fontSize: 18,
            ),
          ),
          onTap: () {}),
    ]),
  );
}
