part of 'demo_api_bloc.dart';

abstract class DemoApiState {}

class DemoApiInitial extends DemoApiState {
  final List<User> users;

  DemoApiInitial(this.users);
}

class DemoApiLoading extends DemoApiState {}

class DemoApiSuccess extends DemoApiState {
  final List<User> users;
  DemoApiSuccess(this.users);
}

class DemoApiError extends DemoApiState {
  final String messageError;
  DemoApiError(this.messageError);
}
