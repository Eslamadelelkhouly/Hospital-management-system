class Failuers {
  final String message;
  Failuers({required this.message});
}

class ServerFailure extends Failuers {
  ServerFailure({required String message}) : super(message: message);
}
