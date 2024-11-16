class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  static List<Product> dummyProducts = [
    Product(
      id: '1',
      name: 'Baby Diapers',
      description: 'Premium quality diapers',
      price: 29.99,
      imageUrl: 'https://example.com/diapers.jpg',
      category: 'Baby Care',
    ),
    // Add more dummy products
  ];
}
