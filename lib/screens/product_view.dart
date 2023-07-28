import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_buttons/custom_button1.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/models/product_model.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({
    required this.product,
    super.key,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.product.image.toString(),
                    height: MediaQuery.of(context).size.height * 0.55,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomPoppinsText(
                    text: widget.product.name.toString(),
                    fontSize: 20,
                  ),
                  CustomPoppinsText(
                    text: "Rs ${widget.product.price.toString()}",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomPoppinsText(
                    text: "Rs ${widget.product.description.toString()}",
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    textOverflow: TextOverflow.visible,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton1(
                ontap: () {},
                text: "Add to Cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
