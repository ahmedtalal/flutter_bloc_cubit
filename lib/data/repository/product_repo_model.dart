import 'package:flutter_cubit/data/model/data_model.dart';

abstract class ProductRepositoryModel {
  List<DataModel> fetchData();
}
