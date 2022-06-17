import 'has_connection.dart';

abstract class ConnectionCheckerAdapter<T> implements HasConnection {
  final T connectionChecker;

  ConnectionCheckerAdapter(this.connectionChecker);
}
