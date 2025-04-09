class Product {
  String productName;
  double _price = 0;
  int _quantity = 0;

  Product({
    required this.productName,
    required double price,
    required int quantity,
  }) {
    this.price = price;
    this.quantity = quantity;
  }

  set price(double newPrice) {
    if (newPrice >= 0) {
      _price = newPrice;
    } else {
      print("Invalid price");
    }
  }

  set quantity(int newQuantity) {
    if (newQuantity >= 0) {
      _quantity = newQuantity;
    } else {
      print("Invalid quantity");
    }
  }

  double get price => _price;
  int get quantity => _quantity;
}
