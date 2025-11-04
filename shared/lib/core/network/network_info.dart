import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<bool> get onConnectionChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker.instance;

  @override
  
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;

  @override

  Stream<bool> get onConnectionChange => internetConnectionChecker
      .onStatusChange
      .map((status) => status == InternetConnectionStatus.connected);
}
