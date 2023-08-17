import 'package:flutter/material.dart';

class PasswordTestField extends StatefulWidget {
  const PasswordTestField({super.key, this.controller});

  final TextEditingController? controller;
  @override
  State<PasswordTestField> createState() => _PasswordTestFieldState();
}

class _PasswordTestFieldState extends State<PasswordTestField> {
  final _hintText = 'Password';

  final _obscuringCharacter = '*';

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      obscureText: _isSecure,
      obscuringCharacter: _obscuringCharacter,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: _hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: _onVisibilityIcon(),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: () {
          _changeLoading();
        },
        icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
      );
  }
}
