class ProductResponse {
  final bool success;
  final List<Product> list;
  final String msg;

  ProductResponse(
      {required this.success, required this.list, required this.msg});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      list:
          (json['list'] as List).map((item) => Product.fromJson(item)).toList(),
      msg: json['msg'],
    );
  }
}

class Product {
  final String title;
  final int price;
  final String image;
  final String type;

  Product(
      {required this.title,
      required this.price,
      required this.image,
      required this.type});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'],
      image: json['image'],
      type: json['type'],
    );
  }
}
