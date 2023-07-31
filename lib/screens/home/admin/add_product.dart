import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button1.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/components/custom_text_field.dart';
import 'package:kwik_mart/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<AdminProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const CustomPoppinsText(
                    text: "Add a New Product",
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      value.pickImage(context);
                    },
                    child: value.image.path != ""
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(value.image),
                          )
                        : const Icon(
                            Icons.production_quantity_limits_outlined,
                            color: Colors.green,
                            size: 100,
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    lable: "Item Name",
                    prefixIcon: Icons.production_quantity_limits_outlined,
                    controller: value.nameController,
                  ),
                  CustomTextField(
                    lable: "Item Description",
                    prefixIcon: Icons.description_outlined,
                    controller: value.descriptionController,
                  ),
                  CustomTextField(
                    lable: "Item Price",
                    prefixIcon: Icons.price_change_outlined,
                    controller: value.priceController,
                    inputType: TextInputType.number,
                  ),
                  CustomTextField(
                    lable: "Item Type",
                    prefixIcon: Icons.type_specimen_outlined,
                    controller: value.typeController,
                  ),
                  CustomButton1(
                      ontap: () {
                        value.addProduct(context);
                      },
                      text: "Add")
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
