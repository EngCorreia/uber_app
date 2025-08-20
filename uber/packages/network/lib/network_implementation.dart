part of network;
class NetworkImplementation implements INetwork {
  final DataConnectionChecker connectionChecker = DataConnectionChecker();

  
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}
