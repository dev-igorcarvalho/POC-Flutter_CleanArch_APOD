import 'package:daily_astronomy/core/adapter/has_connection.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../adapter/connection_checker_adapter.dart';

class ConnectionChecker
    extends ConnectionCheckerAdapter<InternetConnectionChecker>
    implements HasConnection {
  ConnectionChecker(super.connectionChecker);

  @override
  Future<bool> hasConnection() async {
    return await connectionChecker.hasConnection;
  }
}
