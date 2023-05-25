import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Contact Us',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          ListTile(
            leading: Text(
              'Contact Us By :',
              style: TextStyle(
                color: Color(0xff14586E),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.phone_enabled_outlined, color: Color(0xff14586E)),
            title: Text(
              'Phone Nomber:+966532034500',
              style: TextStyle(
                color: Color(0xff14586E),
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email_outlined, color: Color(0xff14586E)),
            title: Text(
              'Email: abc@def,com',
              style: TextStyle(
                color: Color(0xff14586E),
                fontSize: 18,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
