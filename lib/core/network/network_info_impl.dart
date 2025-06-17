import 'package:auvnet_internship_assessment/core/network/network._info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityPlusNetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  ConnectivityPlusNetworkInfoImpl(this.connectivity);

  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    return result.any(
      (res) =>
          res == ConnectivityResult.mobile || res == ConnectivityResult.wifi,
    );
  }
}
