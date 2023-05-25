import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/loadingBar/64x64.gif'),
    );
  }
}
