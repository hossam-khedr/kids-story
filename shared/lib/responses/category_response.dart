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
        id: json['id'] as int,
        name: json['title'] as String,
        image: json['image'] as String,
      );
}
