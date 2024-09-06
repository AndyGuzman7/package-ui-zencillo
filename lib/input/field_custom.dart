import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_zencillo/input/util_field.dart';

class FieldCustom extends StatelessWidget {
  const FieldCustom({
    required this.controller,
    required this.validator,
    required this.onChanged,
    required this.label,
    this.onFocusChange,
    this.isLoading = false,
    this.isLabelTitle = false,
    this.showDecoration = true,
    this.isActiveValidation = true,
    this.showError = false,
    this.inputFormatters,
    this.inputType,
    super.key,
  });
  final ControllerField controller;
  final String? Function(String?) validator;
  final void Function(String) onChanged;
  final void Function(bool)? onFocusChange;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final bool isLoading;
  final String label;
  final bool isLabelTitle;
  final bool showDecoration;
  final bool showError;
  final bool isActiveValidation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isLabelTitle) ...[
          Text(label),
          const SizedBox(height: 5),
        ],
        Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: showDecoration
              ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 16,
                      color: Colors.black12,
                      offset: Offset(0, 4),
                    ),
                  ],
                )
              : null,
          child: FocusScope(
            onFocusChange: onFocusChange,
            child: TextFormField(
              key: controller.fieldKey,
              validator: isActiveValidation ? validator : null,
              inputFormatters: inputFormatters,
              readOnly: isLoading,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.textEditingController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: label,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                errorText: null,
                errorStyle: showError
                    ? const TextStyle(
                        color: Colors.transparent,
                        fontSize: 0,
                      )
                    : null,
                focusedErrorBorder: showError ? InputBorder.none : null,
                errorBorder: showError ? InputBorder.none : null,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: isLoading
                    ? Container(
                        width: 10,
                        height: 10,
                        padding: const EdgeInsets.all(18),
                        child: const CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
