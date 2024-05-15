import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/datum.dart';
import 'package:machine_test/url.dart';

class ApiClass {
  ValueNotifier<List<Product>> productNotifier = ValueNotifier([]);
  ApiClass._internal();
  static ApiClass instance = ApiClass._internal();
  factory ApiClass.getInstance() {
    return instance;
  }

  final dio = Dio();
  final url = URL();

  ApiClass() {
    dio.options = BaseOptions(
        baseUrl: url.productBaseUrl + url.productsEndpoint,
        responseType: ResponseType.json);
  }

  Future<void> getProducts() async {
    try {
      final Map<String, dynamic> data = {'page': 1};
      final Response response = await dio.post(
        url.productBaseUrl + url.productsEndpoint,
        data: data,
        options: Options(
          headers: {'appid': '2IPbyrCUM7s5JZhnB9fxFAD6'},
        ),
      );

      final ProductResponse getProduct =
          ProductResponse.fromJson(response.data);

      if (getProduct.list != null) {
        productNotifier.value.clear();
        productNotifier.value.addAll(getProduct.list!);
      } else {
        productNotifier.value.clear();
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }
}
