import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';

class CustomButton1 extends StatelessWidget {
  final String text;

  const CustomButton1({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green,
        ),
        child: Center(
          child: CustomPoppinsText(
            text: text,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
