import 'package:flutter/material.dart';

class CustomPasswordInput extends StatefulWidget {
  final String labelText;

  const CustomPasswordInput({super.key, required this.labelText});

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool _changeInput = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: _controller,
        obscureText: _changeInput,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _changeInput = !_changeInput;
              });
            },
            child: Icon(
              !_changeInput ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
