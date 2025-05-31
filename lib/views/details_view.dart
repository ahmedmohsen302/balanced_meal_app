import 'package:balanced_meal_app/views/order_view.dart';
import 'package:balanced_meal_app/widgets/custom_detail.dart';
import 'package:balanced_meal_app/widgets/custom_drop_down_detail.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    weightController.addListener(validateForm);
    heightController.addListener(validateForm);
    ageController.addListener(validateForm);
  }

  void validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid != isFormValid) {
      setState(() {
        isFormValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

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
          'Enter your details',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                onChanged: validateForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomDropDownDetail(),
                    CustomDetail(
                      detail: 'Weight',
                      suffix: 'kg',
                      controller: weightController,
                    ),
                    CustomDetail(
                      detail: 'Height',
                      suffix: 'cm',
                      controller: heightController,
                    ),
                    CustomDetail(detail: 'Age', controller: ageController),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 18,
                  ),
                  fixedSize: const Size(327, 60),
                  backgroundColor:
                      isFormValid ? Colors.deepOrangeAccent : Colors.white,
                  foregroundColor: isFormValid ? Colors.white : Colors.grey,
                ),
                onPressed:
                    isFormValid
                        ? () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderView(),
                              ),
                            );
                          }
                        }
                        : null,
                child: const Text('Next', textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
