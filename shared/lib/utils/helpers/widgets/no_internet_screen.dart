import 'package:flutter/material.dart';


class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              "لا يوجد اتصال بالإنترنت",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),


          ],
        ),
      ),
    );
  }
}
