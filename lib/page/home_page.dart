import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  CarouselSlider sliderProducts(List<Product> prd) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0, autoPlay: true),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.network(prd[i].image),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Accueil | Market"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            FutureBuilder<http.Response>(
              future: http
                  .get(Uri.parse("https://fakestoreapi.com/products?limit=6")),
              builder: (_, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  String body = snapshot.data!.body;
                  List<Product> lsProducts = (jsonDecode(body) as List)
                      .map((e) => Product.fromJson(e))
                      .toList();
                  return sliderProducts(lsProducts);
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 75),
            InkWell(
              onTap: () => context.go('/list'),
              borderRadius: BorderRadius.circular(10.0),
              splashColor: Colors.blue.withOpacity(0.4),
              child: Ink(
                  height: 50.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.lightBlue,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Nos produits',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => context.go('/cart'),
              borderRadius: BorderRadius.circular(10.0),
              splashColor: Colors.blue.withOpacity(0.4),
              child: Ink(
                  height: 50.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.lightBlue,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Panier',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ),
          ],
        ));
  }
}
