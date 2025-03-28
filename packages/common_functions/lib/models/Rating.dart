class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  // Create a Rating from a map
  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'] is int ? (map['rate'] as int).toDouble() : map['rate'],
      count: map['count'],
    );
  }

  // Convert a Rating to a map
  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}