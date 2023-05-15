import 'package:clean_architecture_template/data/enums/handle_status.enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninInitial()) {
    on<SigninStarted>(_init);
    on<SigninSubmitted>(_submit);

    add(const SigninStarted());
  }

  void _init(
    SigninStarted event,
    Emitter<SigninState> emitter,
  ) {}

  void _submit(
    SigninSubmitted event,
    Emitter<SigninState> emitter,
  ) {}
}
