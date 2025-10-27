class StoryDetailsResponse {
  final int id;
  final int categoryId;
  final String content;
  final String description;
  final String image;
  final String title;

  StoryDetailsResponse({
    required this.id,
    required this.categoryId,
    required this.content,
    required this.description,
    required this.image,
    required this.title,
  });

  factory StoryDetailsResponse.fromJson(Map<String, dynamic> json) => StoryDetailsResponse(
    id: json['id'],
    categoryId: json['category_id'],
    content: json['content'],
    description: json['description'],
    image: json['image'],
    title: json['title'],
  );
}
