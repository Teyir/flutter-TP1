import 'package:flutter/foundation.dart';
import 'package:liste_produits/model/product_model.dart';

class CartModel extends ChangeNotifier{
  final List<Product> lsProducts;

  CartModel(this.lsProducts);

  addProduct(Product product) {
    lsProducts.add(product);
    notifyListeners();
  }

  removeAllProducts() {
    lsProducts.clear();
    notifyListeners();
  }

  removeProduct(Product product){
    lsProducts.remove(product);
    notifyListeners();
  }

  num getPriceCart(){
    return lsProducts.fold<num>(0.0, (previousValue, element)
    => previousValue+element.price);
  }
}
