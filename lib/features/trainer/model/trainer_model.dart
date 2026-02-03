class Trainer {
  final String id;
  final String name;
  final String specialization;
  final String experience;
  final double rating;
  final String imageUrl;
  final bool isAdded;

  Trainer({
    required this.id,
    required this.name,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.imageUrl,
    this.isAdded = false,
  });
}
