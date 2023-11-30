class Wedding {
  final String name;
  final String briefdesc;
  final String mostpopular;
  final double price;
  final double star;
  final String description;

  final Map<String, dynamic> more;

  Wedding(
      {required this.name,
      required this.briefdesc,
      required this.mostpopular,
      required this.price,
      required this.star,
      required this.description,
      required this.more});
}
