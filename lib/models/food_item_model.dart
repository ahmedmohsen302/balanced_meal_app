class FoodItemModel {
  final String image;
  final String title;
  final int calories;

  FoodItemModel({
    required this.image,
    required this.title,
    required this.calories,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    return FoodItemModel(
      image: json['image_url'] ?? '',
      title: json['food_name'] ?? '',
      calories: json['calories'] ?? 0,
    );
  }
}
