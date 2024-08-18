
import 'package:equatable/equatable.dart';
import 'package:marinoszinonos/ui/abstract/button_state.dart';

class ContactState extends Equatable {
  final ButtonState submitButtonState;
  final String? successMessage;
  final String? errorMessage;

  const ContactState({
    required this.submitButtonState,
    this.successMessage,
    this.errorMessage
  });

  @override
  List<Object?> get props => [
    submitButtonState,
    successMessage,
    errorMessage
  ];
}

class InitialContactState extends ContactState {
  const InitialContactState() : super(submitButtonState: ButtonState.enabled);
}