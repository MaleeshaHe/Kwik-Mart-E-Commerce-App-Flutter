import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> offers = [
    "https://icms-image.slatic.net/images/ims-web/a805d222-5da7-4db0-8616-9a3b1d42c522.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514257_7727218",
    "https://icms-image.slatic.net/images/ims-web/bbb98f3c-aaa2-4fc7-a053-b2535071888b.jpg_1200x1200.jpg",
    "https://icms-image.slatic.net/images/ims-web/2aef1d1a-eeb3-47cd-b28b-1aa263f77da3.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514258_7727218",
    "https://icms-image.slatic.net/images/ims-web/9dae84b6-5ee6-4a63-835f-8b578e65d0f0.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514259_7727218",
    "https://icms-image.slatic.net/images/ims-web/ab55baa1-995a-4dbc-8476-b4c43002f3e9.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514260_7727218",
    "https://icms-image.slatic.net/images/ims-web/b89943bd-35d7-43ff-891e-dddd1738f738.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514261_7727218",
    "https://icms-image.slatic.net/images/ims-web/2b8b57cd-7d3d-4033-b846-3809b42c6228.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514262_7727218",
    "https://icms-image.slatic.net/images/ims-web/665c5908-015f-4846-a991-08202a078e91.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514263_7727218",
    "https://icms-image.slatic.net/images/ims-web/e7ae7a94-e1fe-4b17-b1c8-b83bac739e47.webp?scm=1003.4.icms-zebra-100031632-2885430.OTHER_6502514264_7727218"
  ];

  List<Product> products = [
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
    Product(
      description:
          "Product details of HDMI Cable 1080P Full HD 1.5M, 3M, 5M, 10M Gold Plated Video Cables 3D HDMI-Compatible Flat Cable For HDTV PS Splitter",
      id: 001,
      image:
          "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
      name: "HDMI Cable 1080P Full HD 1.5M",
      price: 460.00,
      type: "electronic",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Icon(Icons.search),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPoppinsText(
              text: "Hello Maleesha",
              fontSize: 22,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
            CustomPoppinsText(
              text: "Lest Start Shopping...",
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 130.0,
                autoPlay: true,
              ),
              items: offers.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(i),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Image.network(
                            products[index].image.toString(),
                            //width: 100,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomPoppinsText(
                                  text: products[index].name.toString(),
                                  fontSize: 13,
                                  textOverflow: TextOverflow.visible,
                                  fontWeight: FontWeight.normal,
                                ),
                                CustomPoppinsText(
                                  text:
                                      "Rs ${products[index].price.toString()}",
                                  fontSize: 13,
                                  textOverflow: TextOverflow.visible,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
