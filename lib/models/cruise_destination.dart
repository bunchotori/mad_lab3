class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  int ratingCount;

  CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.ratingCount,
  });
}