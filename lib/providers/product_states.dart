import 'package:flutter_cubit/data/model/data_model.dart';

abstract class ProductStates {}

class InitialProductState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductLoadedState extends ProductStates {
  List<DataModel> response;
  ProductLoadedState({required this.response});
}

class ProductExceptionState extends ProductStates {
  var error;
  ProductExceptionState({required this.error});
}
