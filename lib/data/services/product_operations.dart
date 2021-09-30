import 'package:flutter_cubit/data/model/data_model.dart';
import 'package:flutter_cubit/data/repository/product_repo_model.dart';

class ProductOperations extends ProductRepositoryModel {
  @override
  List<DataModel> fetchData() {
    return products;
  }
}
