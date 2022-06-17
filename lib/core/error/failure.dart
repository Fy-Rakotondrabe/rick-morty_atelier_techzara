import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class NotConnectedFailure extends Failure {}

class NotFoundFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class BadRequestFailure extends Failure {}

class LockedFailure extends Failure {}

class CacheFailure extends Failure {}

class ConflictFailure extends Failure {}
