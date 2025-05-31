import 'package:flutter/material.dart';

class CustomDropDownDetail extends StatefulWidget {
  const CustomDropDownDetail({super.key});

  @override
  State<CustomDropDownDetail> createState() => _CustomDropDownDetailState();
}

class _CustomDropDownDetailState extends State<CustomDropDownDetail> {
  String? selectedGender;
  bool isDropdownOpen = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isDropdownOpen = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final genders = ['Male', 'Female'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text(
            'Gender',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: DropdownButtonFormField<String>(
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: 'Gender',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            value: selectedGender,
            items:
                genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(gender),
                        if (isDropdownOpen && selectedGender == gender)
                          const Icon(Icons.check, color: Colors.red),
                      ],
                    ),
                  );
                }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a gender';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
