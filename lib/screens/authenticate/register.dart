import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            Container(
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
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffEDEDED),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xffB5B5B5),
                  ),
                  hintText: 'PassWord',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff14586E),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFFFCF02),
                primary: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 28),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff14586E),
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Don’t have an account ?'),
                      TextSpan(
                        text: 'Sign up',
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
