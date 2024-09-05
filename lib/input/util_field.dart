import 'package:flutter/widgets.dart';

class ControllerField {
  final _textEditingController = TextEditingController();
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  TextEditingController get textEditingController => _textEditingController;

  set textEditingController(TextEditingController controller) {
    _textEditingController.text = controller.text;
  }

  GlobalKey<FormFieldState<String>> get fieldKey => _fieldKey;
}

extension CustomFormValidator on GlobalKey<FormState> {
  Map<String, String?> validateAndGetErrors(
      List<GlobalKey<FormFieldState>> fieldKeys) {
    final formState = currentState;
    final errors = <String, String?>{};

    if (formState != null) {
      bool isValid = true;

      for (final key in fieldKeys) {
        final fieldState = key.currentState;

        if (fieldState != null) {
          fieldState.validate();

          if (fieldState.hasError) {
            errors[key.toString()] = fieldState.errorText;
            isValid = false;
          }
        }
      }

      return isValid ? {} : errors;
    }

    return {};
  }
}
