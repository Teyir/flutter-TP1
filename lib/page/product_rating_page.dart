import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/product_model.dart';
import '../model/rate_model.dart';

List<Rate> rates = [
  Rate(1, 2.0, "DarkKiKou", "https://picsum.photos/80/80",
      "Produit insaaaaaaaane"),
  Rate(2, 3.0, "XxPussySlayerxX", "https://picsum.photos/80/80",
      "Hodor. Hodor hodor, hodor. Hodor hodor hodor hodor hodor. Hodor. Hodor! Hodor hodor, hodor; hodor hodor hodor. Hodor. Hodor hodor; hodor hodor - hodor, hodor, hodor hodor. Hodor, hodor. Hodor. Hodor, hodor hodor hodor; hodor hodor; hodor hodor hodor! Hodor hodor HODOR! Hodor hodor... Hodor hodor hodor..."),
  Rate(3, 1.5, "HowbaNoob", "https://picsum.photos/80/80",
      "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium."),
  Rate(4, 0.0, "Bodin", "https://picsum.photos/80/80",
      "Je ne suis qu'un rageux."),
];

class RatingProductPage extends StatefulWidget {
  final Product product;

  const RatingProductPage(this.product, {Key? key}) : super(key: key);

  _RatingProductPageState createState() => _RatingProductPageState(product);
}

class _RatingProductPageState extends State<RatingProductPage> {
  final Product product;

  _RatingProductPageState(this.product, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Avis | ${product.title}"),
        ),
        body: ListView.builder(
            itemCount: rates.length, // NOMBRE D'AVIS
            itemBuilder: (context, index) {
              final Rate rate = rates[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      child: ListTile(
                        title: Text(rate.username),
                        leading: Hero(
                          tag: rate.id,
                          child: Image.network(rate.image),
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (newValue) => setState(() => rate.rating),
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rounded,
                        color: Colors.red,
                      ),
                      direction: Axis.horizontal,
                      initialRating: rate.rating,
                      unratedColor: const Color(0xFF9E9E9E),
                      itemCount: 5,
                      itemSize: 40,
                      glowColor: Colors.amber,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(rate.content),
                    ),
                    const Divider(),
                  ],
                ),
              );
            }));
  }
}
