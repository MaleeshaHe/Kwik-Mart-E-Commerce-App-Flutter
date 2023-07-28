import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button1.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button_google.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/components/custom_text_field.dart';
import 'package:kwik_mart/screens/auth/singup_page.dart';

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: size.width * 0.75,
                image: const AssetImage('assets/images/singinlogo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  "Sign In",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              CustomPoppinsText(
                text: "Please fill your details to login your account",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                height: 20,
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
              CustomPoppinsText(
                text: "Forgot Password ?",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton1(
                ontap: () {},
                text: 'Sing In',
              ),
              CustomButtonGoogle(
                ontap: () {},
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SingUpPage(),
                    ),
                  );
                },
                child: CustomPoppinsText(
                  text: "Don't have an account? Sing Up",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
