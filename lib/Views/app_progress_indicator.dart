import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        color: Color.fromARGB(209, 117, 117, 117),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(
                height: 16,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
