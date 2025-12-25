class Product {
  final int id;
  final String name;
  final String description;
  final num price;
  final String ?imageUrl;
  final String location;
  final int stars;

  Product({
    required this.stars,
    required this.location,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      stars: json['stars'],
      location: json['location'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price']),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'location': location,
      'stars': stars,
    };
  }
}