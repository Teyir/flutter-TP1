import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier "),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () => context.read<CartModel>().removeAllProducts(),
              child: const Text("Vider le panier")),
          Text(
              "Votre panier contient ${context.watch<CartModel>().lsProducts.length} éléments"),
          Consumer<CartModel>(
              builder: (_, cart, __) => Expanded(
                  child: ListView.builder(
                      itemCount: cart.lsProducts.length,
                      itemBuilder: (_, index) => ListTile(
                          subtitle: Text("${cart.lsProducts[index].price} €",
                              style: Theme.of(context).textTheme.titleLarge),
                          leading: Hero(
                            tag: cart.lsProducts[index].id,
                            child: Image.network(cart.lsProducts[index].image,
                                width: 80, height: 80),
                          ),
                          title: Text(cart.lsProducts[index].title),
                          trailing: IconButton(
                            onPressed: () =>
                                cart.removeProduct(cart.lsProducts[index]),
                            icon: const Icon(Icons.delete),
                          ))))),
          Text(
            "Votre panier total est de : ${context.watch<CartModel>().getPriceCart().roundToDouble()}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
