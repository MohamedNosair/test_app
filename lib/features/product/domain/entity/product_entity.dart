abstract class ProductEntity {
  final int id;
  final String name;
  final String description;
  final num price;
  final String? imageUrl;
  final String location;
  final int stars;

  ProductEntity({
    required this.stars,
    required this.location,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
