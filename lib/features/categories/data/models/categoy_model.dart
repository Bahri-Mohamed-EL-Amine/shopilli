import '../../domain/entities/category.dart';

class CategoryModel extends MyCategory {
  const CategoryModel({required super.name});

  factory CategoryModel.fromJson(String str) {
    return CategoryModel(
      name: str,
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
