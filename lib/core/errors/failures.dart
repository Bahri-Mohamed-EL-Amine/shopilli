import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

String mapFailureToString(Failure failure) {
  if (failure is ServerFailure) {
    return "Server Failure";
  } else if (failure is NetworkFailure) {
    return "Network Failure";
  } else {
    return "Unknown Failure";
  }
}
