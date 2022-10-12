import 'package:flutter/material.dart';
import 'package:liste_produits/model/cart_model.dart';
import 'package:liste_produits/model/product_model.dart';
import 'package:provider/provider.dart';
import 'page/cart_page.dart';
import 'page/home_page.dart';
import 'page/product_rating_page.dart';
import 'page/list_product_page.dart';
import 'page/detail_product_page.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(ChangeNotifierProvider<CartModel>(
    create: (_) => CartModel([]),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(initialLocation: '/', routes: <GoRoute>[
    GoRoute(path: '/', builder: (_, state) => const HomePage(), routes: [
      GoRoute(
        path: 'list',
        builder: (_, state) => ListProductPage(),
      ),
      GoRoute(
        path: 'detail',
        builder: (_, state) => DetailProductPage(state.extra as Product),
        routes: [
          GoRoute(
            path: 'rating',
            builder: (_, state) => RatingProductPage(state.extra as Product),
          ),
        ]
      ),
      GoRoute(
        path: 'cart',
        builder: (_, state) => const CartPage(),
      ),
    ])
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      //home: CartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
