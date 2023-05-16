import 'package:clean_architecture_template/core/enums/handle_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInInitial()) {
    on<SignInStarted>(_init);
    on<SignInSubmitted>(_submit);

    add(const SignInStarted());
  }

  void _init(
    SignInStarted event,
    Emitter<SignInState> emitter,
  ) {}

  void _submit(
    SignInSubmitted event,
    Emitter<SignInState> emitter,
  ) {}
}
