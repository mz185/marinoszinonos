
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marinoszinonos/ui/components/state_button/state_button.dart';
import 'package:marinoszinonos/ui/contact/bloc/contact_bloc.dart';
import 'package:marinoszinonos/ui/contact/bloc/contact_event.dart';
import 'package:marinoszinonos/ui/contact/contact_ui_constants.dart';
import 'package:marinoszinonos/utils/formatters/letters_only_formatter.dart';
import 'package:marinoszinonos/utils/regex.dart';
import 'package:marinoszinonos/widgets/height.dart';

import 'bloc/contact_state.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  static const pageId = ContactUiConstants.pageId;

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  build(context) => Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: _nameController,
                autofillHints: const [AutofillHints.name],
                inputFormatters: [LettersOnlyFormatter()],
                decoration: const InputDecoration(
                    labelText: ContactUiConstants.nameLabelText
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ContactUiConstants.nameValidationText;
                  }
                  return null;
                }
            ),
            TextFormField(
                controller: _emailController,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                    labelText: ContactUiConstants.emailLabelText
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(Regex.email).hasMatch(value)) {
                    return ContactUiConstants.emailValidationText;
                  }
                  return null;
                }
            ),
            TextFormField(
                controller: _messageController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: ContactUiConstants.messageLabelText
                ),
                maxLines: ContactUiConstants.messageMaxLines,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ContactUiConstants.messageValidationText;
                  }
                  return null;
                }
            ),
            const Height(ContactUiConstants.spacingHeight),
            Center(
                child: BlocConsumer<ContactBloc, ContactState>(
                    listener: (context, state) {
                      if (state.successMessage != null ||
                          state.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    state.successMessage ??
                                        state.errorMessage!
                                )
                            )
                        );
                      }
                    },
                    builder: (context, state) => StateButton(
                        onPressed: () {
                          final currentState = _formKey.currentState;
                          if (currentState == null) {
                            return;
                          }

                          if (currentState.validate()) {
                            BlocProvider.of<ContactBloc>(context).add(
                                SubmitPressed(
                                    name: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    message: _messageController.text.trim()
                                )
                            );
                          }
                        },
                        buttonState: state.submitButtonState,
                        text: ContactUiConstants.submitButtonText
                    )
                )
            )
          ]
      )
  );
}
