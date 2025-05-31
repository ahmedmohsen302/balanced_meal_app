import 'package:flutter/material.dart';

class CustomDetail extends StatelessWidget {
  const CustomDetail({
    super.key,
    required this.detail,
    this.suffix,
    this.controller,
    this.validator,
  });
  final String detail;
  final String? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            detail,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('Enter your $detail'),
              suffix: Text(suffix ?? ''),
              labelStyle: TextStyle(fontSize: 20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                gapPadding: 24,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator:
                validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $detail';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Enter a valid $detail';
                  }
                  return null;
                },
          ),
        ),
      ],
    );
  }
}
