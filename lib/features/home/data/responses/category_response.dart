class CategoryResponse {
  final int id;
  final String name;
  final String image;

  CategoryResponse({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json['ID'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
      );
}
