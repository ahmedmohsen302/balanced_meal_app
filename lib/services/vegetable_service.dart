import 'package:balanced_meal_app/models/food_item_model.dart';
import 'package:dio/dio.dart';

class VegetableService {
  final dio = Dio();
  final String url =
      'https://redsoftware.notion.site/Vegetable-JSON-7db18acfc4414978a65773b2c41a379f';

  Future<List<FoodItemModel>> fetchVegetables() async {
    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => FoodItemModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load vegetables');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
