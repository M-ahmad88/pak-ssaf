
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus {
  connected,
  disconnected,
}

class InternetConnectivityChecker {
  Stream<InternetStatus> internetStatusStream() async* {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      yield InternetStatus.disconnected;
    } else {
      yield InternetStatus.connected;
    }

    await for (final ConnectivityResult result
    in Connectivity().onConnectivityChanged) {
      if (result == ConnectivityResult.none) {
        yield InternetStatus.disconnected;
      } else {
        yield InternetStatus.connected;
      }
    }
  }
}
