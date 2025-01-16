void main() {
  // Explicit Declaration of Different Data Types
  String mobile_name = 'Tecno';
  int mobile_price = 18000;
  double mscreen_size = 6.7;
  bool in_stock = true;

  print('Mobile Name is $mobile_name of type ${mobile_name.runtimeType}');
  print('Mobile Price is $mobile_price of type ${mobile_price.runtimeType}');
  print('Screen Size is $mscreen_size of type ${mscreen_size.runtimeType}');
  print('isAvailable is $in_stock of type ${in_stock.runtimeType}');

  print('\n');

  // Implicit Declaration
  var laptop_name = 'hp';
  var laptop_price = 30000;
  var lscreen_size = 14.5;
  var available_stock = true;

  print('Laptop Name is $laptop_name of type ${laptop_name.runtimeType}');
  print('Laptop Price is $laptop_price of type ${laptop_price.runtimeType}');
  print('Screen Size is $lscreen_size of type ${lscreen_size.runtimeType}');
  print(
      'isAvailable is $available_stock of type ${available_stock.runtimeType}');
}
