import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/models/product_model.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<Product> products = [
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD",
      price: 460.00,
      type: "electronic",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomPoppinsText(
          text: "My Cart",
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          products[index].image.toString(),
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomPoppinsText(
                                text: products[index].name.toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.visible,
                              ),
                              CustomPoppinsText(
                                text: "Rs ${products[index].price.toString()}",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.remove,
                                size: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CustomPoppinsText(
                                  text: "1",
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
