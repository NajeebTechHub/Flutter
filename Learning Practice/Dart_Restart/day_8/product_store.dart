import 'dart:io';

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, [this.quantity = 0]);

  Product.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price = map['price'],
        quantity = map['quantity'] ?? 0;

  double totalPrice() {
    return price * quantity;
  }

  @override
  String toString() {
    return '''
---Product Info---
name     : $name, 
price    : $price, 
quantity : $quantity, 
total    : ${totalPrice()})
    
    ''';
  }
}

class Store {
  List<Product> productsList = [];

  void addProduct(Product product) {
    productsList.add(product);
  }

  void showInventory() {
    for (var item in productsList) {
      print(item.toString());
    }
  }
}

void main() {
  var store = Store();
  try {
    var input = 'yes';
    while (input == 'yes') {
      print('Enter Product Name : ');
      var name = stdin.readLineSync()!;

      print('Enter Product Price : ');
      var price = double.parse(stdin.readLineSync()!);

      if (name.isEmpty) {
        throw Exception('Please enter product name');
      }
      if (price.isNaN) {
        throw Exception('price can only in number');
      }

      print('Enter Product Quantity : ');
      var quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      var productMap = {'name': name, 'price': price, 'quantity': quantity};

      store.addProduct(Product.fromMap(productMap));

      print('do you want to add more product yes/no');
      var option = stdin.readLineSync();
      input = option!;
    }
  } catch (e) {
    print('Error : $e');
  }

  store.showInventory();
}
