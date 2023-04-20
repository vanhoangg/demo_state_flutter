import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';
import '../../../repository/user_repository.dart';

part 'demo_api_event.dart';
part 'demo_api_state.dart';

class DemoApiBloc extends Bloc<DemoApiEvent, DemoApiState> {
  final IUserRepository userRepository;
  DemoApiBloc({required this.userRepository})
      : super(DemoApiInitial(const [])) {
    on<LoadDataEvent>(_onLoadDataEvent);
  }

  FutureOr<void> _onLoadDataEvent(
      LoadDataEvent event, Emitter<DemoApiState> emit) async {
    emit(DemoApiLoading());
    try {
      final response = await userRepository.fetchUser();
      emit(DemoApiSuccess(response));
    } on Exception catch (e) {
      emit(DemoApiError(e.toString()));
    }
  }
}
