

  import 'Rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
  required this.id,
  required this.title,
  required this.price,
  required this.description,
  required this.category,
  required this.image,
  required this.rating,
  });

  // Create a Product from a map (e.g., from JSON)
  factory Product.fromMap(Map<String, dynamic> map) {
  return Product(
  id: map['id'],
  title: map['title'],
  price: map['price'] is int ? (map['price'] as int).toDouble() : map['price'],
  description: map['description'],
  category: map['category'],
  image: map['image'],
  rating: Rating.fromMap(map['rating']),
  );
  }

  // Convert a Product to a map (e.g., for JSON)
  Map<String, dynamic> toMap() {
  return {
  'id': id,
  'title': title,
  'price': price,
  'description': description,
  'category': category,
  'image': image,
  'rating': rating.toMap(),
  };
  }
  }



