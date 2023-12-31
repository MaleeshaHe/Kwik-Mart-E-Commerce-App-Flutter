import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';

// ignore: must_be_immutable
class CustomButtonGoogle extends StatelessWidget {
  VoidCallback ontap;
  CustomButtonGoogle({
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.shade500,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                width: 25,
                image: AssetImage('assets/images/googleLogo.png'),
              ),
              const SizedBox(
                width: 15,
              ),
              CustomPoppinsText(
                text: "Sing in with Google",
                fontSize: 15,
                color: Colors.grey.shade700,
              )
            ],
          ),
        ),
      ),
    );
  }
}
