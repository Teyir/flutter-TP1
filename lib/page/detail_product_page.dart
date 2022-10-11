import 'package:flutter/material.dart';

import '../product_model.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;

  DetailProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom)),
      body: Center(
          child: Column(
          children: [
            Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  width: 80,
                  height: 80,
                )),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline6),
            ),
            Text(product.description),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Avis", style: Theme.of(context).textTheme.headline6),
            ),
            Text(product.description),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Caractéristiques",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Text(product.description)
          ],
      )),
    );
  }
}
