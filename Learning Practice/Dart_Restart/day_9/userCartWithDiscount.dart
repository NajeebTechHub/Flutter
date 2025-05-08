class Product {
  String name;
  int price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  Product.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price = map['price'],
        quantity = map['quantity'];

  @override
  String toString() {
    return '''
Product Name : $name
Price        : $price
Quantity     : $quantity
''';
  }
}

class Cart {
  List<Product> productList = [];

  void addProduct(Product product) {
    productList.add(product);
  }

  void removeProduct(String name) {
    productList.removeWhere((product) => product.name == name);
    print('Product Remoce Successfully! : $name\n');
  }

  double totalPrice() {
    double total = 0;
    for (var product in productList) {
      total = total + (product.price * product.quantity);
    }
    print('Total Price                : $total');
    if (total > 1000) {
      total = total - (total * 0.1);
      print('Total Price After Discount : $total');
    }
    return total;
  }

  void showCartInfo() {
    for (var product in productList) {
      print(product.toString());
    }
    totalPrice();
  }
}

void main() {
  var cart = Cart();

  List<Map<String, dynamic>> productMap = [
    {'name': 'pen', 'price': 20, 'quantity': 2},
    {'name': 'mouse', 'price': 200, 'quantity': 1},
    {'name': 'pen', 'price': 400, 'quantity': 3},
  ];

  for (var map in productMap) {
    cart.addProduct(Product.fromMap(map));
  }

  print('---Product Removing---');
  cart.removeProduct('mouse');

  print('---Show Cart Info---');
  cart.showCartInfo();
}
