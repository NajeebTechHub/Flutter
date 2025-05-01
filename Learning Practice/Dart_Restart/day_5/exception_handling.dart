void devide(int a, int b) {
  try {
    if (b == 0) {
      throw Exception('can\'t devide');
    } else {
      print(a / b);
    }
  } catch (e) {
    print('Error : $e');
  }
}

void main() {
  devide(10, 0);
}
