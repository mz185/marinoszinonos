
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marinoszinonos/data/firebase_functions_constants.dart';
import 'package:marinoszinonos/data/models/sender.dart';
import 'package:marinoszinonos/ui/abstract/button_state.dart';
import 'package:marinoszinonos/ui/contact/bloc/contact_event.dart';
import 'package:marinoszinonos/ui/contact/bloc/contact_state.dart';
import 'package:marinoszinonos/ui/contact/contact_ui_constants.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const InitialContactState()) {

    on<SubmitPressed>((event, emit) async {
      emit(const ContactState(submitButtonState: ButtonState.loading));

      try {
        final callable = FirebaseFunctions.instanceFor(
            region: FirebaseFunctionsConstants.region
        ).httpsCallable(FirebaseFunctionsConstants.functionSendEmail);

        await callable.call(
            Sender(
                name: event.name,
                email: event.email,
                message: event.message
            ).toJson()
        );

        emit(
            const ContactState(
                submitButtonState: ButtonState.enabled,
                successMessage: ContactUiConstants.submitSuccessText
            )
        );
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }

        emit(
            const ContactState(
                submitButtonState: ButtonState.enabled,
                errorMessage: ContactUiConstants.submitErrorText
            )
        );
      }
    });
  }
}