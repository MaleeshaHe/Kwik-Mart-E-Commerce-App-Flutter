import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button1.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/components/custom_text_field.dart';
import 'package:kwik_mart/controllers/auth_controller.dart';
import 'package:kwik_mart/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      value.pickImage();
                    },
                    child: value.image.path != ""
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(value.image),
                          )
                        : Image.network(
                            Provider.of<UserProvider>(context)
                                .userData!
                                .userImage
                                .toString(),
                            width: 150,
                            height: 150,
                          ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomPoppinsText(
                    fontWeight: FontWeight.w400,
                    text: Provider.of<UserProvider>(context)
                        .userData!
                        .email
                        .toString(),
                    fontSize: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lable: "Name",
                    prefixIcon: Icons.abc,
                    controller: value.nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton1(
                    ontap: () {
                      value.updateProfile();
                    },
                    text: "Update",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton1(
                    ontap: () {
                      AuthController.singOut();
                    },
                    text: "Sign Out",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
