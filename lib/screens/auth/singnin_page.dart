import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button1.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/components/custom_text_field.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: size.width * 0.6,
              image: const AssetImage('assets/images/singinlogo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Please fill your details to login your account",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            CustomTextField(
              lable: "Email",
              prefixIcon: Icons.email_outlined,
              controller: _emailController,
            ),
            CustomTextField(
              lable: "Password",
              prefixIcon: Icons.password_outlined,
              isPassword: true,
              controller: _passWordController,
            ),
            const CustomButton1(
              text: 'Sing In',
            )
          ],
        ),
      ),
    );
  }
}
