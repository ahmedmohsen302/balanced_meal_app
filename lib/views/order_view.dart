import 'package:balanced_meal_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            size: 20,
          ), // Custom icon & color
          onPressed: () => Navigator.of(context).pop(), // Go back
        ),
        title: const Text(
          'Create your order',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(children: [CustomCard()]),
    );
  }
}
