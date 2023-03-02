import 'dart:convert';

import 'package:cuaca_app/app/modules/home/views/home_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeModel? homeModel;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<HomeModel>> getData() async {
    final response = await http.get(
        Uri.parse('https://ibnux.github.io/BMKG-importer/cuaca/501233.json'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listData = getPostsData.map((i) => HomeModel.fromJson(i)).toList();
      return listData;
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
