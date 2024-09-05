import 'package:flutter/material.dart';
import 'package:ui_zencillo/input/util_field.dart';

class FieldCustom extends StatelessWidget {
  const FieldCustom({
    required this.controller,
    required this.validator,
    required this.onChanged,
    required this.onFocusChange,
    required this.label,
    this.isLoading = false,
    super.key,
  });
  final ControllerField controller;
  final String? Function(String?) validator;
  final void Function(String) onChanged;
  final void Function(bool) onFocusChange;
  final bool isLoading;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FocusScope(
        onFocusChange: onFocusChange,
        child: TextFormField(
          key: controller.fieldKey,
          validator: validator,
          readOnly: isLoading,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller.textEditingController,
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            hintText: label,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            errorText: null,
            errorStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0,
            ),
            focusedErrorBorder: InputBorder.none,
            errorBorder: InputBorder.none,
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
    );
  }
}
