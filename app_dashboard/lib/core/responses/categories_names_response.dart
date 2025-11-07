class CategoriesNamesResponse{
  final int id;
  final String name;


  CategoriesNamesResponse({required this.id,required this.name});


  factory CategoriesNamesResponse.fromJson(Map<String,dynamic>json)=>
      CategoriesNamesResponse(id:json['id'], name: json['name']);
}