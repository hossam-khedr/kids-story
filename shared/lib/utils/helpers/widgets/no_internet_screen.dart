import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared/core/base_cubit/cubit.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final connected = await InternetConnectionChecker.hasConnection;
                if (connected && context.mounted) {
                  context.read<BaseCubit>().emit(ConnectionConnected());
                }
              },
              child: const Text("إعادة المحاولة"),
            )
          ],
        ),
      ),
    );
  }
}
