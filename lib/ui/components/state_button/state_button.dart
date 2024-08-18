
import 'package:flutter/material.dart';
import 'package:marinoszinonos/ui/abstract/button_state.dart';
import 'package:marinoszinonos/ui/components/state_button/state_button_ui_constants.dart';

class StateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonState buttonState;
  final String text;

  const StateButton({
    super.key,
    required this.onPressed,
    required this.buttonState,
    required this.text
  });

  @override
  build(context) => ElevatedButton(
      onPressed: buttonState == ButtonState.disabled
          || buttonState == ButtonState.loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonState == ButtonState.disabled
              ? Colors.grey
              : null
      ),
      child: buttonState == ButtonState.loading ? SizedBox.fromSize(
        size: StateButtonUiConstants.loadingIndicatorSize,
        child: const CircularProgressIndicator(),
      ) : Text(text)
  );
}
