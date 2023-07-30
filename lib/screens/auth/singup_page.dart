import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button1.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button_google.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/components/custom_text_field.dart';
import 'package:kwik_mart/providers/signup_provider.dart';
import 'package:kwik_mart/screens/auth/singnin_page.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingUpPage> {
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
          child: Animate(
            effects: [FadeEffect(duration: 800.ms)],
            child: Consumer<SignUpProvider>(
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: size.width * 0.60,
                      image: const AssetImage('assets/images/singinlogo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    CustomPoppinsText(
                      text: "Please fill your details to Sing up your account",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      lable: "Name",
                      prefixIcon: Icons.people_outline_outlined,
                      controller: value.nameController,
                    ),
                    CustomTextField(
                      lable: "Email",
                      prefixIcon: Icons.email_outlined,
                      controller: value.emailController,
                    ),
                    CustomTextField(
                      lable: "Password",
                      prefixIcon: Icons.password_outlined,
                      isPassword: true,
                      controller: value.passWordController,
                    ),
                    CustomTextField(
                      lable: "Confirm Password",
                      prefixIcon: Icons.password_outlined,
                      isPassword: true,
                      controller: value.confirmPassWordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton1(
                      ontap: () {
                        Provider.of<SignUpProvider>(context, listen: false)
                            .signUpUser();
                      },
                      text: 'Sing Up',
                    ),
                    CustomButtonGoogle(
                      ontap: () {},
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingInPage(),
                          ),
                        );
                      },
                      child: CustomPoppinsText(
                        text: "If you have an account? Sing In",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
